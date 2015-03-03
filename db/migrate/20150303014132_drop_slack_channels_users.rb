class DropSlackChannelsUsers < ActiveRecord::Migration
  def change
    drop_table :slack_channels_users
  end
end
