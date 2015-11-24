class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string "title"
      t.string "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer "user_id"
    end
  end
end
