class SlackUser < ActiveRecord::Base
  belongs_to :slack_team

  validates :slack_id, :slack_team, :name, presence: true
end
