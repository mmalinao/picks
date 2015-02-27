class Pick < ActiveRecord::Base
  belongs_to :slack_user
  belongs_to :sports_team

  validates :slack_user, :sports_team, :wins_by, presence: true
end
