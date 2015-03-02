require 'rails_helper'

RSpec.describe SlackTeam, type: :model do
  it { is_expected.to have_many :slack_channels }
  it { is_expected.to have_many(:slack_users).through(:slack_channels) }

  it { is_expected.to validate_presence_of :token }
  it { is_expected.to validate_presence_of :domain }
  it { is_expected.to validate_uniqueness_of :domain }

  describe '.authenticate_with_token' do
    subject { SlackTeam.authenticate_with_token(domain, token) }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let(:domain) { slack_team.domain }
    let(:token) { slack_team.token }

    it 'should return existing slack team' do
      is_expected.to eq slack_team
    end

    context 'when slack team does not exist with given domain' do
      let(:domain) { 'foo' }
      it { is_expected.to be_nil }
    end

    context 'when slack team does not exist with given token' do
      let(:token) { 'bar' }
      it { is_expected.to be_nil }
    end
  end

  describe '#domain=' do
    subject(:do_set) { slack_team.domain = new_domain }

    let!(:slack_team) { FactoryGirl.create(:slack_team) }
    let(:new_domain) { 'NewDomain' }

    it 'should downcase domain' do
      expect { do_set }.to change { slack_team.domain }.to('newdomain')
    end
  end
end
