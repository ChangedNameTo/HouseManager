# == Schema Information
#
# Table name: announcements
#
#  id              :integer          not null, primary key
#  title           :string           not null
#  body            :string           not null
#  author_id       :integer          not null
#  organization_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :announcement do
    title {Faker::Lorem.sentence}
    body  {Faker::Lorem.paragraph}
    user
    organization
  end
end
