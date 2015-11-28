class Department < ActiveRecord::Base
  belongs_to :user
  has_many :department_categories
  has_many :categories, through: :department_categories
  validates :title, presence: true, length: {minimum: 4, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 1500}
  validates :user_id, presence: true

end