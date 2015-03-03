class SlackChannelUser < ActiveRecord::Base
  self.table_name = 'slack_channels_users'
  belongs_to :slack_channel, foreign_key: :slack_channel_sid
  belongs_to :slack_user, foreign_key: :slack_user_sid

  validates :slack_channel, :slack_user, presence: true
  validates :slack_channel_sid, uniqueness: { scope: :slack_user_sid }
end
