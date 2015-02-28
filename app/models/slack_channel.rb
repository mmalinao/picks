class SlackChannel < ActiveRecord::Base
  belongs_to :slack_team

  validates :slack_id, :slack_team, presence: true

  enum sports_type: [:hoops, :pucks, :pigskins, :futbol, :march_madness]
end
