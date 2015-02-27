class CreateSportsTeams < ActiveRecord::Migration
  def change
    create_table :sports_teams do |t|
      t.string :type
      t.string :uid, index: true

      t.timestamps null: false
    end
  end
end
