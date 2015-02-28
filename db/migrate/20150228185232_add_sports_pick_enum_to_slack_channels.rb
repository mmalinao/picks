class AddSportsPickEnumToSlackChannels < ActiveRecord::Migration
  def change
    add_column :slack_channels, :sports_type, :integer, default: 0
    remove_column :slack_channels, :name
  end
end
