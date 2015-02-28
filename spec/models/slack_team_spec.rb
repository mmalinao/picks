require 'rails_helper'

RSpec.describe SlackTeam, type: :model do
  it { is_expected.to have_many :slack_users }
  it { is_expected.to have_many :slack_channels }

  it { is_expected.to validate_presence_of :slack_id }
  it { is_expected.to validate_presence_of :token }

  describe '.authenticate_with_token' do
    subject { SlackTeam.authenticate_with_token(slack_id, token) }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let(:slack_id) { slack_team.slack_id }
    let(:token) { slack_team.token }

    it 'should return existing slack team' do
      is_expected.to eq slack_team
    end

    context 'when slack team does not exist with given slack_id' do
      let(:slack_id) { 'foo' }
      it { is_expected.to be_nil }
    end

    context 'when slack team does not exist with given token' do
      let(:token) { 'bar' }
      it { is_expected.to be_nil }
    end
  end
end
