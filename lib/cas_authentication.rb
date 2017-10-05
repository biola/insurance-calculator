##
# Authenticate User and Create Session
class CasAuthentication
  def initialize(session)
    @session = session
  end

  def user
    return unless username.present?
    @user ||= User.find_or_initialize_by(username: username)
  end

  def perform
    return true if authenticated?
    return unless session['cas'].present?
    return unless (new_user? || unauthenticated?) && update_extra_attributes!

    authenticate!
  end

  private

  attr_reader :session

  def update_extra_attributes!
    cas_attr = HashWithIndifferentAccess.new(extra_attributes)

    entitlements = urns_to_roles(cas_attr[:eduPersonEntitlement] ||
      {}, Settings.urn_namespaces)

    user.biola_id = extra_attr(:employeeId) if extra_attr_has_key?(:employeeId)

    if extra_attr_has_key?(:eduPersonNickname)
      user.first_name = extra_attr(:eduPersonNickname)
    end

    user.last_name = extra_attr(:sn) if extra_attr_has_key?(:sn)
    user.email = extra_attr(:mail) if extra_attr_has_key?(:mail)

    if extra_attr_has_key?(:url)
      user.photo_url = extra_attr(:url).gsub('.jpg', '_large.jpg')
    end

    user.update_roles!(extra_attrs(:eduPersonEntitlement), 'entitlements')
    user.update_roles!(extra_attrs(:eduPersonAffiliation), 'affiliations')
    user.save &&
      user.update_roles!(cas_attr[:eduPersonAffiliation] || {}, :affiliation) &&
      user.update_roles!(entitlements, :entitlement)
  end

  def present?
    session['cas'].present?
  end

  def new_user?
    return false unless user.present?
    user.new_record?
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

  def username
    (session[:username] || attrs[:user]).try(:downcase)
  end

  def attrs
    @attrs ||= (session['cas'] || {}).with_indifferent_access
  end

  def extra_attributes
    @extra_attributes ||=
      (attrs['extra_attributes'] || {}).with_indifferent_access
  end

  def extra_attr_has_key?(key)
    extra_attributes.key? key
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
