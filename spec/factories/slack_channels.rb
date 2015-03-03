FactoryGirl.define do
  factory :slack_channel do
    sid { "C#{Faker::Number.number(10)}" }
    slack_team
    sports_type { :pucks } # use anything other than the default enum

    trait :hoops         do sports_type :hoops end
    trait :pucks         do sports_type :pucks end
    trait :pigskins      do sports_type :pigskins end
    trait :futbol        do sports_type :futbol end
    trait :march_madness do sports_type :march_madness end
  end
end
