class RenameIdeasToDepartments < ActiveRecord::Migration
  def change
    rename_table :departments, :dumbtable
    rename_table :ideas, :departments
  end
end
