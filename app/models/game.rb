class Game < ActiveRecord::Base
  validates :schedule, presence: true
end
