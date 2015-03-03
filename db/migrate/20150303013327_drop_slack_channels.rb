class DropSlackChannels < ActiveRecord::Migration
  def change
    drop_table :slack_channels
  end
end
