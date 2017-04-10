# == Schema Information
#
# Table name: meals
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  time            :time             not null
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :meal, aliases: [:meal_id] do
    name         {Faker::Name.first_name}
    time         {Faker::Time.between(DateTime.now - 1, DateTime.now)}
  end
end
