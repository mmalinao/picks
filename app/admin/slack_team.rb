ActiveAdmin.register SlackTeam do
  permit_params :token, :slack_id

  form do |f|
    inputs 'Details' do
      input :slack_id
      input :token
    end
    actions
  end
end
