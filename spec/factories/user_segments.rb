FactoryBot.define do
  factory :user_segment do
    segment
    user
    pr { Faker::Number.number(4) }
    perf_perc { Faker::Number.decimal(2) }
  end
end
