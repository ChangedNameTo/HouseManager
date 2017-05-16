# == Schema Information
#
# Table name: maintenance_request_priorities
#
#  id          :integer          not null, primary key
#  label       :string           not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :maintenance_request_priority do
    label       {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
  end
end
