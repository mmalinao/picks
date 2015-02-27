class CreateSlackChannels < ActiveRecord::Migration
  def change
    create_table :slack_channels do |t|
      t.string :slack_id, index: true
      t.string :name

      t.timestamps null: false
    end
  end
end
