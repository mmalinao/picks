require 'rails_helper'

RSpec.describe Pick, type: :model do
  it { is_expected.to belong_to :slack_user }
  it { is_expected.to belong_to :sports_team }

  it { is_expected.to validate_presence_of :slack_user }
  it { is_expected.to validate_presence_of :sports_team }
  it { is_expected.to validate_presence_of :wins_by }
end
