class MaintenanceRequestPolicy < ApplicationPolicy
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
    user.has_role?(Role.where(label: ['System Admin', 'House Manager', 'Organization Manager'])) or user == record
  end

  def update?
    destroy?
  end

  def edit?
    destroy?
  end

  def change_started_status?
    user.has_role?(Role.where(label: ['System Admin', 'House Manager', 'Organization Manager']))
  end

  def change_finished_status?
    change_started_status?
  end
end
