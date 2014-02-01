class DisciplinePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end

  def update?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
