class LatePlate < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :organization, foreign_key: 'organization_id'
  has_one :meal, foreign_key: 'meal'

  def requester_name
    User.find(self.user_id).full_name
  end

  def meal_name
    Meal.find(self.meal_id).meal_name
  end
end
