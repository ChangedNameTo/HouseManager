class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin']))
  end

  def show?
    index?
  end

  def create?
    user.has_role?(Role.where(label: ['System Admin']))
  end

  def destroy?
    create?
  end
end
