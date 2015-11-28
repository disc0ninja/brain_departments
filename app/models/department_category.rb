class DepartmentCategory < ActiveRecord::Base

  belongs_to :department
  belongs_to :category

end
