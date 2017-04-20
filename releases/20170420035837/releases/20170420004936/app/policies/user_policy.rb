class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def show?
    index?
  end

  def update_positions?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Admin', 'User Admin']))
  end

  def organization_enable
    update_positions?
  end

  def organization_disable
    update_positions?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin'])) or user.record
  end

  def show_private_info?
    update?
  end

end
