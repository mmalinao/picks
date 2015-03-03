FactoryGirl.define do
  factory :slack_channel_user do
    slack_channel
    slack_user
  end
end
