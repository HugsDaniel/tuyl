class AddStatusToUserActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :user_activities, :status, :string, default: "in progress"
  end
end
