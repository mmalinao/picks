FactoryGirl.define do
  factory :nba_team do
    uid { 'LAC' }

    trait :scheduled_tonight do
      after(:create) do |nba_team, evaluator|
        create(:game, home_team: nba_team, schedule: DateTime.now.utc.change(hour: 18))
      end
    end
  end
end
