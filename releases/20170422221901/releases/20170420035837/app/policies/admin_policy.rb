class AdminPolicy < ApplicationPolicy
  def home?
    user.has_role?(Role.where(label: ['System Admin']))
  end
end
