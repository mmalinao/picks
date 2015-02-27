FactoryGirl.define do
  factory :game do
    schedule { Faker::Date.forward(7) }
  end
end
