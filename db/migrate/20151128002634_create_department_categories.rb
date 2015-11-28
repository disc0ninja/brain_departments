class CreateDepartmentCategories < ActiveRecord::Migration
  def change
    create_table :department_categories do |t|
      t.integer :department_id
      t.integer :category_id
    end
  end
end
