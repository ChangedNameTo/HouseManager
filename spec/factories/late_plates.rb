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

FactoryGirl.define do
  factory :late_plate do
    day          { Faker::Date.between(2.days.ago, Date.today) }
    completed    false
    meal
    user
    organization
  end
end
