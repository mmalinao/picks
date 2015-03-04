class SlackChannel < ActiveRecord::Base
  self.primary_key = 'sid'
  belongs_to :slack_team
  has_many :slack_channel_users, foreign_key: :slack_channel_sid
  has_many :slack_users, through: :slack_channel_users

  validates :slack_team, :sports_type, presence: true

  enum sports_type: [:hoops, :pucks, :pigskins, :futbol, :march_madness]

  def first_slack_user_or_create(sid, name)
    user = slack_users.find_by_sid(sid)

    if user.nil?
      user = SlackUser.find_by_sid(sid)
      if user
        slack_users << user
      else
        user = slack_users.build(sid: sid, name: name)
        user.save
      end
    end

    user
  end
end
