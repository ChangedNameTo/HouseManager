class ServiceHourPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    show?
  end

  def create?
    show?
  end

  def index?
    show?
  end

  def show?
    user.has_role?(Role.where(label: ['Member']))
  end

  def destroy?
    user.has_role?(Role.where(label: ['System Admin', 'Service Manager', 'Organization Manager'])) or user == record
  end

  def update?
    destroy?
  end

  def edit?
    destroy?
  end

  def admin?
    destroy?
  end

  def show_user?
    destroy?
  end
end
