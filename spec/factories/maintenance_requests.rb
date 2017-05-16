# == Schema Information
#
# Table name: maintenance_requests
#
#  id              :integer          not null, primary key
#  issue_title     :string           not null
#  description     :string           not null
#  reporter_id     :integer          not null
#  organization_id :integer          not null
#  priority_id     :integer          not null
#  started         :boolean          default(FALSE)
#  finished        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :maintenance_request do
    issue_title  {Faker::Lorem.sentence}
    description  {Faker::Lorem.paragraph}
    user
    organization
    maintenance_request_priority
    started      {Faker::Boolean.boolean}
    finished     {Faker::Boolean.boolean}
  end
end
