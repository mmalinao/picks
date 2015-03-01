class AddDomainToSlackTeams < ActiveRecord::Migration
  def change
    add_column :slack_teams, :domain, :string
    add_index :slack_teams, :domain
    remove_index :slack_teams, :slack_id
  end
end
