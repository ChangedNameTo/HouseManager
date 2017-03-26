class LatePlate < ApplicationRecord
  belongs_to :user, foreign_key: 'requester'
  has_one :meal, foreign_key: 'meal'
  has_one :organization, foreign_key: 'organization'

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
