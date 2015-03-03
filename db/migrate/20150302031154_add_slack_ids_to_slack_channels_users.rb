class AddSlackIdsToSlackChannelsUsers < ActiveRecord::Migration
  def change
    add_column :slack_channels_users, :slack_channel_slack_id, :integer
    add_column :slack_channels_users, :slack_user_slack_id, :integer

    add_index :slack_channels_users, :slack_channel_slack_id
    add_index :slack_channels_users, :slack_user_slack_id
  end
end
