FactoryGirl.define do
  factory :pick do
    slack_user
    association :sports_team, factory: :nba_team
    wins_by { Faker::Number.number(2).to_i }
  end
end
