class DropSlackUsers < ActiveRecord::Migration
  def change
    drop_table :slack_users
  end
end
