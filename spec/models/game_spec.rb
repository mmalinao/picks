require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:home_team).class_name(SportsTeam) }
  it { is_expected.to belong_to(:away_team).class_name(SportsTeam) }

  it { is_expected.to validate_presence_of :schedule }
  it { is_expected.to validate_presence_of :home_team }
  it { is_expected.to validate_presence_of :away_team }

  describe '.scheduled_today' do
    subject { Game.scheduled_today }

    before(:each) { allow(Date).to receive(:today).and_return DateTime.new(2015, 1, 1) }
    let!(:game) { FactoryGirl.create(:game, schedule: schedule) }

    context 'when scheduled today' do
      let(:schedule) { DateTime.new(2015, 1, 1, 18) } # 6:00 pm

      it 'should include games scheduled today' do
        is_expected.to include game
      end
    end

    context 'when scheduled date has passed' do
      let(:schedule) { DateTime.new(2014, 12, 31, 18) }

      it 'should not include games in the past' do
        is_expected.to_not include game
      end
    end

    context 'when scheduled for tomorrow' do
      let(:schedule) { DateTime.new(2015, 1, 2, 18) }

      it 'should not include games in the future' do
        is_expected.to_not include game
      end
    end
  end
end
