class SlackUser < ActiveRecord::Base
  belongs_to :slack_team

  validates :slack_id, :name, presence: true
end
