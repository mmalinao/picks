FactoryGirl.define do
  factory :slack_user do
    sid { "U#{Faker::Number.number(10)}" }
    name { Faker::Name.name }
  end
end
