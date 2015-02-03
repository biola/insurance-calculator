class CasAuthentication
  def initialize(session)
    @session = session
  end

  def user
    if username.present?
      @user ||= User.find_or_initialize_by(username: username)
    end
  end

  def perform
    if authenticated?
      true
    elsif present?
      if new_user?
        if create_user!
          authenticate!
        end
      elsif unauthenticated?
        authenticate!
        update_extra_attributes!
      end
    end
  end

  private

  attr_reader :session

  def present?
    session['cas'].present?
  end

  def new_user?
    !!user.try(:new_record?)
  end

  def authenticated?
    session[:username].present?
  end

  def unauthenticated?
    !authenticated?
  end

  def authenticate!
    session[:username] = username
  end

  def update_extra_attributes!
    cas_attr = HashWithIndifferentAccess.new(extra_attributes)

    entitlements = urns_to_roles(cas_attr[:eduPersonEntitlement] || {}, Settings.urn_namespaces)
    
    user.biola_id     = extra_attr(:employeeId)                     if extra_attr_has_key?(:employeeId)
    user.first_name   = extra_attr(:eduPersonNickname)              if extra_attr_has_key?(:eduPersonNickname)
    user.last_name    = extra_attr(:sn)                             if extra_attr_has_key?(:sn)
    user.email        = extra_attr(:mail)                           if extra_attr_has_key?(:mail)
    user.photo_url    = extra_attr(:url).gsub('.jpg', '_large.jpg') if extra_attr_has_key?(:url)
    #user.entitlements = extra_attrs(:eduPersonEntitlement)          if extra_attr_has_key?(:eduPersonEntitlement)
    #user.affiliations = extra_attrs(:eduPersonAffiliation)          if extra_attr_has_key?(:eduPersonAffiliation)
    user.update_roles!(extra_attrs(:eduPersonEntitlement),"entitlements")
    user.update_roles!(extra_attrs(:eduPersonAffiliation),"affiliations")
    user.save \
    && user.update_roles!(cas_attr[:eduPersonAffiliation] || {}, :affiliation) \
    && user.update_roles!(entitlements, :entitlement)
  end
  alias :create_user! :update_extra_attributes!

  def username
    session[:username] || attrs['user']
  end

  def attrs
    @attrs ||= (session['cas'] || {}).with_indifferent_access
  end

  def extra_attributes
    @extra_attributes ||= (attrs['extra_attributes'] || {}).with_indifferent_access
  end

  def extra_attr_has_key?(key)
    extra_attributes.has_key? key
  end

  def extra_attr(key)
    # Many values come back as arrays but don't really need to be
    extra_attrs(key).first
  end

  def extra_attrs(key)
    Array(extra_attributes[key]).map(&:to_s)
  end

  def urns_to_roles(urns, nids)
    clean_urns = urns.map { |e| e.gsub(/^urn:/i, '') }
    clean_nids = nids.map { |n| n.gsub(/^urn:/i, '') }

    clean_urns.map { |urn|
      clean_nids.map { |nid|
        urn[0...nid.length] == nid ? urn[nid.length..urn.length] : nil
      }
    }.flatten.compact
  end
end