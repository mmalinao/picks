class SlackTeam < ActiveRecord::Base
  has_many :slack_channels
  has_many :slack_users, through: :slack_channels

  validates :slack_id, :domain, :token, presence: true
  validates :domain, uniqueness: true

  def self.authenticate_with_token(slack_id, token)
    team = SlackTeam.find_by_slack_id(slack_id)
    team && Devise.secure_compare(team.token, token) ? team : nil
  end
end
