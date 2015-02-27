require 'rails_helper'

RSpec.describe SlackChannel, type: :model do
  it { is_expected.to validate_presence_of :slack_id }
end
