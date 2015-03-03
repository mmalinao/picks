class SlackChannelUser < ActiveRecord::Base
  self.table_name = 'slack_channels_users'
  belongs_to :slack_channel, foreign_key: :slack_channel_sid, inverse_of: :slack_channel_users
  belongs_to :slack_user, foreign_key: :slack_user_sid, inverse_of: :slack_channel_users

  validates :slack_channel, :slack_user, presence: true
  validates :slack_channel_sid, uniqueness: { scope: :slack_user_sid }
end
