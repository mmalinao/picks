class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.belongs_to :slack_user, index: true
      t.belongs_to :sports_team, index: true
      t.integer :wins_by

      t.timestamps null: false
    end
  end
end
