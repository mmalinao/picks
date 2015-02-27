class SportsTeam < ActiveRecord::Base
  validates :uid, presence: true
end
