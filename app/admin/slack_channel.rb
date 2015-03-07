ActiveAdmin.register SlackChannel do
  remove_filter :slack_channel_users
  remove_filter :slack_users
end
