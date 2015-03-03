class RecreateSlackChannelsUsers < ActiveRecord::Migration
  def change
    create_table :slack_channels_users, id: false do |t|
      t.string :slack_channel_sid, null: false
      t.string :slack_user_sid, null: false

      t.timestamps
    end

    add_index :slack_channels_users, :slack_channel_sid
    add_index :slack_channels_users, :slack_user_sid
  end
end
