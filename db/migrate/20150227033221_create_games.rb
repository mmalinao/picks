class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :schedule

      t.timestamps null: false
    end
  end
end
