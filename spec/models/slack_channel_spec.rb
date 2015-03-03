require 'rails_helper'

RSpec.describe SlackChannel, type: :model do
  it { is_expected.to belong_to :slack_team }
  it { is_expected.to have_many(:slack_channel_users).with_foreign_key(:slack_channel_sid) }
  it { is_expected.to have_many(:slack_users).through(:slack_channel_users) }

  it { is_expected.to validate_presence_of :slack_team }
  it { is_expected.to validate_presence_of :sports_type }

  xdescribe '.sports_channel_for' do
    subject(:do_action) { SlackChannel.sports_channel_for(slack_team, slack_id, sports_type) }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let(:slack_id) { 'C111' }
    let(:sports_type) { 'hoops' }
    let(:new_channel) { SlackChannel.last }

    it 'should create a new SlackChannel' do
      expect { do_action }.to change { SlackChannel.count }.by(1)
    end

    it 'should create a new SlackChannel with chanel id' do
      do_action
      expect(new_channel.slack_id).to eq slack_id
    end

    it 'should create a new SlackChannel with sports_type' do
      do_action
      expect(new_channel.sports_type).to eq sports_type
    end

    it 'should create a new SlackChannel associated with slack team' do
      do_action
      expect(new_channel.slack_team).to eq slack_team
    end

    it 'should return a SlackChannel' do
      expect(do_action).to be_kind_of SlackChannel
    end

    context 'when SlackChannel already exists' do
      let!(:slack_channel) { FactoryGirl.create(:slack_channel, :hoops, slack_team: slack_team) }
      let(:slack_id) { slack_channel.slack_id }

      it 'should return existing SlackChannel' do
        expect(do_action).to eq slack_channel
      end

      it 'should not create a new SlackChannel' do
        expect { do_action }.to_not change { SlackChannel.count }
      end
    end
  end
end
