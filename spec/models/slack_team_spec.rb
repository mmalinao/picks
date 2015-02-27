require 'rails_helper'

RSpec.describe SlackTeam, type: :model do
  it { is_expected.to have_many :slack_users }

  it { is_expected.to validate_presence_of :slack_id }
end
