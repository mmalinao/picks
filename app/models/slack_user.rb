class SlackUser < ActiveRecord::Base
  self.primary_key = 'sid'
  has_many :slack_channel_users, foreign_key: :slack_user_sid
  has_many :slack_channels, through: :slack_channel_users

  validates :name, presence: true
end
