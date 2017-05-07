class LatePlatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin', 'Member' ]))
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Kitchen Manager', 'Organization Manager' ])) or user == record
  end

  def destroy?
    update?
  end
end
