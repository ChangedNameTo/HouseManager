class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: 'System Admin'))
  end

  def show?
    user.has_role?(Role.where(label: ['System Admin', 'Member']))
  end

  def create?
    index?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Manager']))
  end

  def organization_enable_all?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Manager', 'User Manager']))
  end

  def organization_disable_all?
    organization_enable_all?
  end

  def destroy?
    index?
  end
end
