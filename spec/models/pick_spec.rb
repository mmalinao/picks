require 'rails_helper'

RSpec.describe Pick, type: :model do
  it { is_expected.to belong_to(:slack_user).with_foreign_key(:slack_user_sid) }
  it { is_expected.to belong_to :sports_team }

  it { is_expected.to validate_presence_of :slack_user }
  it { is_expected.to validate_presence_of :sports_team }
  it { is_expected.to validate_presence_of :wins_by }

  describe '#parse_command' do
    subject(:match_data) { pick.send(:parse_command, "#{sports_team_uid} by #{points}") }

    let(:pick) { FactoryGirl.create(:pick) }
    let(:sports_team_uid) { 'LAC' }
    let(:points) { 10 }

    it 'should parse sports team uid' do
      expect(match_data[:sports_team_uid]).to eq sports_team_uid
    end

    it 'should parse points' do
      expect(match_data[:points].to_i).to eq points
    end

    context 'when invalid sports team uid' do
      let(:sports_team_uid) { 'LA' }
      it { is_expected.to be_nil }
    end

    context 'when invalid points' do
      let(:points) { 'b' }
      it { is_expected.to be_nil }
    end
  end
end
