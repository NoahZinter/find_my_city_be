FactoryBot.define do
  factory :user do
    # google_id { Faker::Lorem.characters(number: 12) }
    # token { Faker::Lorem.characters(number: 12) }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 12) }
  end
end