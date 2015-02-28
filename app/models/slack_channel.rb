class SlackChannel < ActiveRecord::Base
  belongs_to :slack_team

  validates :slack_id, :slack_team, :sports_type, presence: true

  enum sports_type: [:hoops, :pucks, :pigskins, :futbol, :march_madness]

  def self.sports_channel_for(slack_team, slack_id, sports_type)
    channel = SlackChannel.find_by_slack_id(slack_id)
    channel.nil? ? create(slack_team: slack_team, slack_id: slack_id, sports_type: sports_type) : channel
  end
end
