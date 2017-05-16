class MaintenanceRequestCommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    user.has_role?(Role.where(label: ['Member'])) or destroy?
  end

  def edit?
    destroy?
  end

  def update?
    destroy?
  end

  def destroy?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Manager', 'House Manager' ])) or user == record
  end
end
