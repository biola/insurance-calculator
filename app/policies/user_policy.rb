class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      return unless user.admin?
      scope.all
    end
  end

  def index?
    user.admin?
  end

  alias show? index?
end
