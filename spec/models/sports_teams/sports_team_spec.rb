require 'rails_helper'

RSpec.describe SportsTeam, type: :model do
  it { is_expected.to have_many(:home_games).with_foreign_key(:home_team_id).class_name(Game) }
  it { is_expected.to have_many(:road_games).with_foreign_key(:away_team_id).class_name(Game) }

  it { is_expected.to validate_presence_of :uid }
  # it { is_expected.to validate_uniqueness_of :uid }
end
