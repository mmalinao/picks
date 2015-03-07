class Pick < ActiveRecord::Base
  belongs_to :slack_user, foreign_key: :slack_user_sid
  belongs_to :sports_team

  validates :slack_user, :sports_team, :wins_by, presence: true

  def self.create_for_user(user, command)
    match_data = parse_command(command)
    fail PickError::InvalidCommand if match_data.nil?

    team = SportsTeam.find_by_uid(match_data[:sports_team_uid]) # TODO: case-insensitive
    fail PickError::SportsTeamNotFound if team.nil?

    fail PickError::SportsTeamNotScheduled unless team.playing_today?

    Pick.create(slack_user: user, sports_team: team, wins_by: match_data[:points])
  end

  def self.parse_command(text)
    /^(?<sports_team_uid>\D{3}) by (?<points>\d+)$/.match(text)
  end
end
