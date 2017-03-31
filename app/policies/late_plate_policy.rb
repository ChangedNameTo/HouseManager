class LatePlatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # This is currently broken. As part of Users 2.0 member needs to be automatically assigned to someone.
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
    index?
  end

  def destroy?
    user.has_role?(Role.where(label: ['System Admin', 'Kitchen Manager', 'Organization Manager' ]))
  end
end
