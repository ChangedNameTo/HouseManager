class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin']))
  end

  def show?
    user.has_role?(Role.where(label: ['Member']))
  end

  def update_positions?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Manager', 'User Manager']))
  end

  def organization_enable?
    update_positions?
  end

  def organization_disable?
    update_positions?
  end

  def destroy?
    index?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin'])) or user == record
  end
end
