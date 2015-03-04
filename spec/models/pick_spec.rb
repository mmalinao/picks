require 'rails_helper'

RSpec.describe Pick, type: :model do
  it { is_expected.to belong_to(:slack_user).with_foreign_key(:slack_user_sid) }
  it { is_expected.to belong_to :sports_team }

  it { is_expected.to validate_presence_of :slack_user }
  it { is_expected.to validate_presence_of :sports_team }
  it { is_expected.to validate_presence_of :wins_by }

  describe '.create_for_user' do
    subject(:do_create) { Pick.create_for_user(user, command) }

    let(:user) { FactoryGirl.create(:slack_user) }
    let(:command) { "#{team_uid} by 10" }
    let!(:nba_team) { FactoryGirl.create(:nba_team, uid: 'LAC') }
    let(:team_uid) { nba_team.uid }

    let(:new_pick) { Pick.last }

    it 'should create a new Pick' do
      expect { do_create }.to change { Pick.count }.by(1)
    end

    it 'should create a new Pick with given params' do
      do_create
      expect(new_pick).to have_attributes slack_user_sid: user.sid, sports_team_id: nba_team.id, wins_by: 10
    end

    it 'should return a new Pick' do
      is_expected.to eq new_pick
    end

    context 'when given invalid command' do
      before(:each) { allow(Pick).to receive(:parse_command).and_return(nil) }

      it 'should raise PickError' do
        expect { do_create }.to raise_error PickError
      end
    end

    context 'when sports team does not exist' do
      let(:team_uid) { 'foo' }

      it 'should raise PickError' do
        expect { do_create }.to raise_error PickError
      end
    end
  end

  describe '.parse_command' do
    subject(:match_data) { Pick.parse_command("#{sports_team_uid} by #{points}") }

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
