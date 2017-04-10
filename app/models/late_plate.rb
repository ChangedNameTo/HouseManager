# == Schema Information
#
# Table name: late_plates
#
#  id              :integer          not null, primary key
#  day             :date             not null
#  completed       :boolean          default(FALSE), not null
#  meal_id         :integer          not null
#  user_id         :integer          not null
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class LatePlate < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :organization, foreign_key: 'organization_id'
  has_one :meal, foreign_key: 'meal'

  # Validation
  validates :day, presence: true

  validates :completed, presence: true

  validates :meal_id, presence: true

  validates :user_id, presence: true

  def requester_name
    User.find(self.user_id).full_name
  end

  def meal_name
    Meal.find(self.meal_id).meal_name
  end
end
