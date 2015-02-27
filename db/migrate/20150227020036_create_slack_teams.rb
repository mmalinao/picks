class CreateSlackTeams < ActiveRecord::Migration
  def change
    create_table :slack_teams do |t|
      t.string :slack_id, index: true

      t.timestamps null: false
    end

    add_index :slack_users, :slack_id
  end
end
