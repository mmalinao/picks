class AddSlackTeamReferenceToSlackChannels < ActiveRecord::Migration
  def change
    add_reference :slack_channels, :slack_team, index: true
  end
end
