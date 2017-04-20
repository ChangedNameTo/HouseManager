class UserRolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Admin', 'User Admin']))
  end

  def create?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Admin', 'User Admin']))
  end

  def destroy?
    create?
  end
end
