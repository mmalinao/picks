require 'rails_helper'

RSpec.describe SlackChannel, type: :model do
  it { is_expected.to belong_to :slack_team }

  it { is_expected.to validate_presence_of :slack_id }
  it { is_expected.to validate_presence_of :slack_team }
  it { is_expected.to validate_presence_of :sports_type }
end
