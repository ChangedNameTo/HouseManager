class AnnouncementPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.has_role?(Role.where(label: ['Member']))
  end

  def show?
    index?
  end

  def create?
    index?
  end

  def update?
    user.has_role?(Role.where(label: ['System Admin', 'Organization Manager' ])) or record == user
  end

  def destroy?
    update?
  end
end
