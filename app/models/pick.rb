class Pick < ActiveRecord::Base
  belongs_to :slack_user, foreign_key: :slack_user_sid
  belongs_to :sports_team

  validates :slack_user, :sports_team, :wins_by, presence: true

  def self.create_from_command(command)
  end

  private

  def parse_command(text)
    /^(?<sports_team_uid>\D{3}) by (?<points>\d+)$/.match(text)
  end
end
