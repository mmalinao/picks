FactoryGirl.define do
  factory :slack_channel do
    slack_id { "C#{Faker::Number.number(10)}" }
  end
end
