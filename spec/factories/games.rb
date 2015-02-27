FactoryGirl.define do
  factory :game do
    association :home_team, factory: :nba_team
    association :away_team, factory: :nba_team
    schedule { Faker::Time.forward(7, :evening) }
  end
end
