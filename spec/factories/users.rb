FactoryBot.define do
  factory :user do
    google_id { Faker::Lorem.characters(number: 12) }
    email { Faker::Internet.email }
    token { Faker::Lorem.characters(number: 12) }
  end
end