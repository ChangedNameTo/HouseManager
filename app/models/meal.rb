# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  time            :time             not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Meal < ApplicationRecord
  has_many :late_plates

  def meal_name
    "#{name} at #{short_time}"
  end

  def short_time
    time.strftime("%I:%M %p")
  end
end
