FactoryGirl.define do
  factory :slack_team do
    slack_id { "T#{Faker::Number.number(4)}" }
    token { Faker::Lorem.characters(24) }
  end
end
