class SportsTeam < ActiveRecord::Base
  has_many :home_games, foreign_key: :home_team_id, class_name: Game
  has_many :road_games, foreign_key: :away_team_id, class_name: Game

  validates :uid, presence: true # uniqueness: true

  def playing_today?
    home_games.scheduled_today.count > 0 || road_games.scheduled_today.count > 0
  end
end
