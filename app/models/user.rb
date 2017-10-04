class User < ActiveRecord::Base
  include Humanity::Base

  def name
    "#{first_name} #{last_name}"
  end

  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :biola_id, presence: true, uniqueness: true

  def affiliations
    @affiliations ||= roles.where(Humanity::Assignment.by_source(:affilation))
  end

  def entitlements
    @entitlements ||= roles.where(Humanity::Assignment.by_source(:entitlement))
  end

  def authorized_roles
    roles & Authorization::Engine.instance.roles.map(&:to_s)
  end
end
