class UserRolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin']))
  end

  def create?
    index?
  end

  def destroy?
    index?
  end
end
