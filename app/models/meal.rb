class Meal < ApplicationRecord
  has_many :late_plates

  def meal_name
    "#{name} at #{short_time}"
  end

  def short_time
    time.to_s(:time)
  end
end
