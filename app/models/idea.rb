class Idea < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 4, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 1500}

end