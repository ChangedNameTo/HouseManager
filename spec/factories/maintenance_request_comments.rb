# == Schema Information
#
# Table name: maintenance_request_comments
#
#  id                     :integer          not null, primary key
#  maintenance_request_id :integer          not null
#  body                   :string           not null
#  author_id              :integer          not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :maintenance_request_comment do
    maintenance_request
    body  {Faker::Lorem.paragraph}
    user
  end
end
