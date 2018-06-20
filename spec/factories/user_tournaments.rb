FactoryBot.define do
  factory :user_tournament do
    tournament
    user
    total_perf_perc { Faker::Number.decimal(2) }
  end
end
