class SlackChannel < ActiveRecord::Base
  self.primary_key = 'sid'
  belongs_to :slack_team
  has_and_belongs_to_many :slack_users, association_foreign_key: :slack_channel_sid, foreign_key: :slack_user_sid

  validates :slack_team, :sports_type, presence: true

  enum sports_type: [:hoops, :pucks, :pigskins, :futbol, :march_madness]

  def self.sports_channel_for(slack_team, slack_id, sports_type)
    channel = SlackChannel.find_by_slack_id(slack_id)
    channel.nil? ? create(slack_team: slack_team, slack_id: slack_id, sports_type: sports_type) : channel
  end

  def create_associated_slack_user
    # TODO: need to create join model plus the slack_ids...
  end
end
