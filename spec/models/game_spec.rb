require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to belong_to(:home_team).class_name(SportsTeam) }
  it { is_expected.to belong_to(:away_team).class_name(SportsTeam) }

  it { is_expected.to validate_presence_of :schedule }
  it { is_expected.to validate_presence_of :home_team }
  it { is_expected.to validate_presence_of :away_team }
end
