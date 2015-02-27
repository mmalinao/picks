require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to validate_presence_of :schedule }
end
