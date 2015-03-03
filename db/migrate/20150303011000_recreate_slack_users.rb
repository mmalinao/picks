class RecreateSlackUsers < ActiveRecord::Migration
  def change
    create_table :slack_users, id: false do |t|
      t.string :sid, null: false # slack id
      t.string :name

      t.timestamps
    end

    add_index :slack_users, :sid, unique: true
  end
end
