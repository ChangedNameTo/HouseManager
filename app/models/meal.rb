class Meal < ApplicationRecord
  has_many :late_plates

  def meal_name
    "#{name} at #{time}"
  end
end
