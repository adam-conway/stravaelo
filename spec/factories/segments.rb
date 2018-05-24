FactoryBot.define do
  factory :segment do
    name { Faker::Hobbit.location }
    distance { Faker::Number.decimal(2) }
    average_grade { Faker::Number.decimal(2) }
    maximum_grade { Faker::Number.decimal(2) }
    elevation_high { Faker::Number.decimal(2) }
    elevation_low { Faker::Number.decimal(2) }
    total_elevation_gain { Faker::Number.decimal(2) }
    athlete_attempts { Faker::Number.number(4) }
    unique_athletes { Faker::Number.number(2) }
  end
end
