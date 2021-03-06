class CreateUserActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :user_activities do |t|
      t.references :user, foreign_key: true
      t.references :activity, foreign_key: true
      t.datetime :begin_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
