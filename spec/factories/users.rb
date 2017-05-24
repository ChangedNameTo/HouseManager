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
  factory :user, aliases: [:creator, :organization_manager, :user_manager, :kitchen_manager, :house_manager, :service_manager, :scholarship_manager, :user_id, :author] do
    first_name       {Faker::Name.first_name}
    last_name        {Faker::Name.last_name}
    email_address    {Faker::Internet.email}
    provider         {Faker::Lorem.word}
    uid              {Faker::Lorem.characters(10)}
    oauth_token      {Faker::Lorem.characters(10)}
    oauth_expires_at {Faker::Time.between(DateTime.now, DateTime.now + 12.days)}

    trait :org_man do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Organization Manager')
        )
      end
    end

    trait :sys_admin do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'System Admin')
        )
      end
    end

    trait :user_man do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'User Manager')
        )
      end
    end

    trait :kit_man do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Kitchen Manager')
        )
      end
    end

    trait :house_man do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'House Manager')
        )
      end
    end

    trait :serv_man do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Service Manager')
        )
      end
    end

    trait :member do
      after(:create) do |user|
        UserRole.create!(
          user: user,
          role: Role.find_by(label: 'Member')
        )
      end
    end
  end
end
