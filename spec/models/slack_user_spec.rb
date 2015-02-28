require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  it { is_expected.to validate_presence_of :slack_id }
  it { is_expected.to validate_presence_of :name }
end
