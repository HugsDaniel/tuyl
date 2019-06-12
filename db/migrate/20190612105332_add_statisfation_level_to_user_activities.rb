class AddStatisfationLevelToUserActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :user_activities, :satisfaction_level, :integer
  end
end
