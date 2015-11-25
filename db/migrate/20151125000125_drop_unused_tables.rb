class DropUnusedTables < ActiveRecord::Migration
  def change
    drop_table :comments
    drop_table :dumbtable
  end
end
