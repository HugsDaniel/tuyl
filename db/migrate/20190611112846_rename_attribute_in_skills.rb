class RenameAttributeInSkills < ActiveRecord::Migration[5.2]
  def change
    rename_column :skills, :attribute, :character
  end
end
