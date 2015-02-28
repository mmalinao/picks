class AddTokenToSlackTeams < ActiveRecord::Migration
  def change
    add_column :slack_teams, :token, :string
    add_index :slack_teams, :token
  end
end
