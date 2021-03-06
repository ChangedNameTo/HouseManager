# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  first_name              :string           not null
#  last_name               :string           not null
#  phone_number            :string
#  enabled                 :boolean          default(FALSE), not null
#  email_address           :string           not null
#  provider                :string           not null
#  uid                     :string           not null
#  oauth_token             :string           not null
#  oauth_expires_at        :datetime         not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  affiliated_organization :integer
#  image                   :string
#  number                  :integer
#  big                     :integer
#

FactoryGirl.define do
  factory :user, aliases: [:creator, :organization_manager, :user_manager, :kitchen_manager, :house_manager, :service_manager, :scholarship_manager, :user_id] do
    first_name       {Faker::Name.first_name}
    last_name        {Faker::Name.last_name}
    email_address    {Faker::Internet.email}
    provider         {Faker::Lorem.word}
    uid              {Faker::Lorem.characters(10)}
    oauth_token      {Faker::Lorem.characters(10)}
    oauth_expires_at {Faker::Time.between(DateTime.now, DateTime.now + 12.days)}
  end
end
