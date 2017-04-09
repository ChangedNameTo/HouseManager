# == Schema Information
#
# Table name: organizations
#
#  id                   :integer          not null, primary key
#  full_name            :string           not null
#  abbreviation         :string           not null
#  school               :string           not null
#  address              :string           not null
#  organization_manager :integer
#  user_manager         :integer
#  kitchen_manager      :integer
#  house_manager        :integer
#  service_manager      :integer
#  scholarship_manager  :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

FactoryGirl.define do
  factory :organization do
    full_name            {Faker::Lorem.word}
    abbreviation         {Faker::Lorem.word}
    school               {Faker::University.name}
    address              {Faker::Address.street_address}
    organization_manager
    user_manager
    kitchen_manager
    house_manager
    service_manager
    scholarship_manager
  end
end
