class SlackUser < ActiveRecord::Base
  validates :slack_id, :name, presence: true
end
