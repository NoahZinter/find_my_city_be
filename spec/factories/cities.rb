FactoryBot.define do
  factory :city do
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
    summary { Faker::Lorem.paragraph }
    total_score { Faker::Number.between(from: 0.0, to: 100.0)}
    categories_hash_array { Faker::Lorem.words(number: 4) }
    population { Faker::Number.between(from: 100, to: 1000000)}
  end
end