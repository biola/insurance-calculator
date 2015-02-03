class CoveragePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      end
    end
  end

  def index?
    user.admin?
  end

  alias :show? :index?
  alias :create? :index?
  alias :new? :index?
  alias :update? :index?
  alias :edit? :index?
  alias :destroy? :index?
end