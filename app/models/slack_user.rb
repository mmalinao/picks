class SlackUser < ActiveRecord::Base
  self.primary_key = 'sid'
  has_and_belongs_to_many :slack_channels

  validates :name, presence: true
end
