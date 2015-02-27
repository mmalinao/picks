class SlackChannel < ActiveRecord::Base
  belongs_to :slack_team

  validates :slack_id, presence: true
end
