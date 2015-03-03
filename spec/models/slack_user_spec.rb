require 'rails_helper'

RSpec.describe SlackUser, type: :model do
  it { is_expected.to have_and_belong_to_many :slack_channels }

  it { is_expected.to validate_presence_of :name }
end
