require 'rails_helper'

RSpec.describe SlackChannelUser, type: :model do
  it { is_expected.to belong_to(:slack_channel).with_foreign_key(:slack_channel_sid) }
  it { is_expected.to belong_to(:slack_user).with_foreign_key(:slack_user_sid) }

  it { is_expected.to validate_presence_of :slack_channel }
  it { is_expected.to validate_presence_of :slack_user }

  describe 'custom validationes' do
    subject { FactoryGirl.build(:slack_channel_user) }
    it { is_expected.to validate_uniqueness_of(:slack_channel_sid).scoped_to(:slack_user_sid) }
  end
end
