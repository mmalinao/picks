require 'rails_helper'

RSpec.describe SportsTeam, type: :model do
  it { is_expected.to validate_presence_of :uid }
end
