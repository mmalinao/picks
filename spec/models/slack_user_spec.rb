require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  it { is_expected.to have_many(:slack_channel_users).with_foreign_key(:slack_user_sid) }
  it { is_expected.to have_many(:slack_channels).through(:slack_channel_users) }

  it { is_expected.to validate_presence_of :name }
end
