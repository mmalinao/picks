ActiveAdmin.register Game do
  permit_params :home_team_id, :away_team_id, :schedule

  form do |f|
    inputs 'Details' do
      input :home_team_id, as: :select, collection: NbaTeam.all.map { |team| [team.uid, team.id] }
      input :away_team_id, as: :select, collection: NbaTeam.all.map { |team| [team.uid, team.id] }
      input :schedule, as: :string
    end
    actions
  end
end
