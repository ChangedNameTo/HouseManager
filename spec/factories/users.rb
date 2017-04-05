FactoryGirl.define do
  factory :user do
    first_name       {Faker::Name.first_name}
    last_name        {Faker::Name.last_name}
    email_address    {Faker::Internet.email}
    provider         {Faker::Lorem.word}
    uid              {Faker::Lorem.characters(10)}
    oauth_token      {Faker::Lorem.characters(10)}
    oauth_expires_at {Faker::Time.between(DateTime.now, DateTime.now + 12.days)}
  end
end
