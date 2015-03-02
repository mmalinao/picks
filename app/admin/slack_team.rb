ActiveAdmin.register SlackTeam do
  permit_params :token, :domain

  form do |f|
    inputs 'Details' do
      input :token
      input :domain
    end
    actions
  end
end
