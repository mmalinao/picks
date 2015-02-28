class SlackUser < ActiveRecord::Base
  has_and_belongs_to_many :slack_channels

  validates :slack_id, :name, presence: true
end
