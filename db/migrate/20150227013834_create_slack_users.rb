class CreateSlackUsers < ActiveRecord::Migration
  def change
    create_table :slack_users do |t|
      t.string :slack_id
      t.string :name

      t.timestamps null: false
    end
  end
end
