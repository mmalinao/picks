FactoryGirl.define do
  factory :slack_team do
    token { Faker::Lorem.characters(24) }
    domain { Faker::Internet.domain_word }
  end
end
