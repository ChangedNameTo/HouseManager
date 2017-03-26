class LatePlate < ApplicationRecord
  has_one :user, foreign_key: 'requester'
  has_one :meal, foreign_key: 'meal'
end
