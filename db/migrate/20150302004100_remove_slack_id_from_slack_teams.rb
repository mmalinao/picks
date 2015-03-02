class RemoveSlackIdFromSlackTeams < ActiveRecord::Migration
  def change
    remove_column :slack_teams, :slack_id
  end
end
