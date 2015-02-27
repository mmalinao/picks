FactoryGirl.define do
  factory :nba_team do
    uid { Faker::Lorem.characters(3).upcase }
  end
end
