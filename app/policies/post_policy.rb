class PostPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def update?
    admin?
  end

  def create?
    !user.nil?
  end

  def destroy?
    admin?
  end

  def index?
    true
  end
end
