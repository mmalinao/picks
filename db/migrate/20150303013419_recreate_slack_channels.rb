class RecreateSlackChannels < ActiveRecord::Migration
  def change
    create_table :slack_channels, id: false do |t|
      t.string :sid, null: false # slack id
      t.belongs_to :slack_team
      t.integer :sports_type, default: 0

      t.timestamps
    end

    add_index :slack_channels, :sid, unique: true
    add_index :slack_channels, :slack_team_id
  end
end
