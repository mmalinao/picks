ActiveAdmin.register SlackUser do
  remove_filter :slack_channel_users
  remove_filter :slack_channels
end
