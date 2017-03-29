class LatePlate < ApplicationRecord
  belongs_to :user, foreign_key: 'requester'
  belongs_to :organization, foreign_key: 'organization_id'
  has_one :meal, foreign_key: 'meal'

  def requester_name
    User.find(self.requester).full_name
  end

  def meal_name
    Meal.find(self.meal_id).meal_name
  end

  def current_meal_requests
    late_plates = []
    late_plates.concat(get_current_meal_requests(self))
  end

  def get_current_meal_requests(organization)
    requests = []
    LatePlate.where(organization: self.id).each do |request|
      requests.append(request)
    end

    requests
  end
end
