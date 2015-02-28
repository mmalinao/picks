FactoryGirl.define do
  factory :slack_user do
    slack_id { "U#{Faker::Number.number(10)}" }
    name { Faker::Name.name }
    slack_team
  end
end
