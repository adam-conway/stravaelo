FactoryBot.define do
  factory :user do
    sequence(:uid) { |n| "#{n}" }
    sequence(:email)    { |n| "email#{n}@email.com" }
    sequence(:token)    { |n| "467#{n}" }
    name { Faker::StarWars.character }
  end
end
