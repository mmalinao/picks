class SportsTeam < ActiveRecord::Base
  has_many :home_games, foreign_key: :home_team_id, class_name: Game
  has_many :road_games, foreign_key: :away_team_id, class_name: Game

  validates :uid, presence: true
end
