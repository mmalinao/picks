ActiveAdmin.register SlackTeam do
  permit_params :token, :domain

  remove_filter :slack_channels
  remove_filter :slack_users

  form do |f|
    inputs 'Details' do
      input :token
      input :domain
    end
    actions
  end
end
