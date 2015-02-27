FactoryGirl.define do
  factory :slack_team do
    slack_id { "T#{Faker::Number.number(4)}" }
  end
end
