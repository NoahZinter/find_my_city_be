FactoryBot.define do
  factory :favorite do
    user_id { Faker::Number.between(from: 0, to: 20) }
    city_id { Faker::Number.between(from: 0, to: 20) }
  end
end