class SlackUser < ActiveRecord::Base
  self.primary_key = 'sid'
  has_and_belongs_to_many :slack_channels, association_foreign_key: :slack_user_sid, foreign_key: :slack_channel_sid

  validates :name, presence: true
end
