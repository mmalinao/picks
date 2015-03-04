class RemoveSlackUserReferenceOnPicks < ActiveRecord::Migration
  def change
    remove_column :picks, :slack_user_id
  end
end
