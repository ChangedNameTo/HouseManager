class MealPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['System Admin', 'Kitchen Manager', 'Organization Manager' ]))
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
    index?
  end
end
