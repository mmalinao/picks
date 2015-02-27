class SlackTeam < ActiveRecord::Base
  has_many :slack_users
  has_many :slack_channels

  validates :slack_id, presence: true
end
