require 'rails_helper'

RSpec.describe SlackChannel, type: :model do
  it { is_expected.to belong_to :slack_team }
  it { is_expected.to have_many(:slack_channel_users).with_foreign_key(:slack_channel_sid) }
  it { is_expected.to have_many(:slack_users).through(:slack_channel_users) }

  it { is_expected.to validate_presence_of :slack_team }
  it { is_expected.to validate_presence_of :sports_type }

  describe '#first_slack_user_or_create' do
    subject(:do_action) { channel.first_slack_user_or_create(user.sid, user.name) }

    let!(:channel) { FactoryGirl.create(:slack_channel) }

    context 'when slack user exists and associated with slack channel' do
      let!(:user) do
        u = channel.slack_users.build FactoryGirl.attributes_for(:slack_user)
        u.save
        u
      end

      it 'should not create a new SlackUser' do
        expect { do_action }.to_not change { SlackUser.count }
      end

      it 'should not create a new SlackChannelUser' do
        expect { do_action }.to_not change { SlackChannelUser.count }
      end

      it 'should return existing SlackUser' do
        is_expected.to eq user
      end
    end

    context 'when slack user exists but not associated with slack channel' do
      let!(:user) { FactoryGirl.create(:slack_user) }

      it 'should not create a new SlackUser' do
        expect { do_action }.to_not change { SlackUser.count }
      end

      it 'should create a new SlackChannelUser' do
        expect { do_action }.to change { SlackChannelUser.count }.by(1)
      end

      it 'should return existing SlackUser' do
        is_expected.to eq user
      end
    end

    context 'when slack user does not exist' do
      let(:user) { FactoryGirl.build(:slack_user) }

      it 'should create a new SlackUser' do
        expect { do_action }.to change { SlackUser.count }.by(1)
      end

      it 'should create a new SlackUser with given params' do
        is_expected.to have_attributes sid: user.sid, name: user.name
      end

      it 'should create a new SlackUser associated with SlackChannel' do
        do_action
        expect(channel.slack_users).to include user
      end
    end
  end
end
