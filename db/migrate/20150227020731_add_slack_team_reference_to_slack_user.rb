class AddSlackTeamReferenceToSlackUser < ActiveRecord::Migration
  def change
    add_reference :slack_users, :slack_team, index: true
  end
end
