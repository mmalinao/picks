class RemoveSlackTeamReferenceOnSlackUsers < ActiveRecord::Migration
  def change
    remove_column :slack_users, :slack_team_id
  end
end
