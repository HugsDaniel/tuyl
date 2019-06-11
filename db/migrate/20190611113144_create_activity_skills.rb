class CreateActivitySkills < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_skills do |t|
      t.references :activity, foreign_key: true
      t.references :skill, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
