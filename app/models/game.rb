class Game < ActiveRecord::Base
  belongs_to :home_team, class_name: SportsTeam
  belongs_to :away_team, class_name: SportsTeam

  validates :home_team, :away_team, :schedule, presence: true
end
