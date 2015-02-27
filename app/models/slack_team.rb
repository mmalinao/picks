class SlackTeam < ActiveRecord::Base
  has_many :slack_users

  validates :slack_id, presence: true
end
