class Category < ActiveRecord::Base
  has_many :department_categories
  has_many :departments, through: :department_categories
  validates :name, presence: true, length: {minimum: 4, maximum: 25}
  validates_uniqueness_of :name

end
