class SlackTeam < ActiveRecord::Base
  has_many :slack_channels
  has_many :slack_users, through: :slack_channels

  validates :domain, :token, presence: true
  validates :domain, uniqueness: true

  def self.authenticate_with_token(domain, token)
    team = SlackTeam.find_by_domain(domain)
    team && Devise.secure_compare(team.token, token) ? team : nil
  end
end
