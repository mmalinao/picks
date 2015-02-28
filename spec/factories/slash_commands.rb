FactoryGirl.define do
  factory :slash_command, class: Hash do
    skip_create

    token { Faker::Lorem.characters(24) }
    team_id { "T#{Faker::Number.number(4)}" }
    channel_id { "C#{Faker::Number.number(10)}" }
    channel_name { Faker::App.name }
    user_id { "U#{Faker::Number.number(10)}" }
    user_name { Faker::Name.name }
    command { "/pick" }
    text { "#{Faker::Lorem.characters(3).upcase} by #{Faker::Number.number(2).to_i}" }

    initialize_with { attributes }
  end
end