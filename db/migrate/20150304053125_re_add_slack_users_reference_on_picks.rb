class ReAddSlackUsersReferenceOnPicks < ActiveRecord::Migration
  def change
    add_column :picks, :slack_user_sid, :string
    add_index :picks, :slack_user_sid
  end
end
