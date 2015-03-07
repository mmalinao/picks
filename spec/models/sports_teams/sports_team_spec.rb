require 'rails_helper'

RSpec.describe SportsTeam, type: :model do
  it { is_expected.to have_many(:home_games).with_foreign_key(:home_team_id).class_name(Game) }
  it { is_expected.to have_many(:road_games).with_foreign_key(:away_team_id).class_name(Game) }

  it { is_expected.to validate_presence_of :uid }
  # it { is_expected.to validate_uniqueness_of :uid }

  describe '#playing_today?' do
    subject { sports_team.playing_today? }

    before(:each) { allow(Date).to receive(:today).and_return(Date.new(2015, 1, 1)) }
    let(:sports_team) { FactoryGirl.create(:nba_team) }

    context 'when has a home game scheduled today' do
      let!(:game) { FactoryGirl.create(:game, home_team: sports_team, schedule: DateTime.new(2015, 1, 1, 18)) }
      it { is_expected.to be_truthy }
    end

    context 'when has a road game scheduled today' do
      let!(:game) { FactoryGirl.create(:game, away_team: sports_team, schedule: DateTime.new(2015, 1, 1, 18)) }
      it { is_expected.to be_truthy }
    end

    context 'when has no games scheduled today' do
      it { is_expected.to be_falsey }
    end
  end
end
