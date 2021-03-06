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
    index?
  end

  def destroy?
    index?
  end
end
