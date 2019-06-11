class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills do |t|
      t.string :name
      t.string :description
      t.string :attribute
      t.string :icon

      t.timestamps
    end
  end
end
