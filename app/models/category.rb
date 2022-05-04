class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 30 }
  validates_uniqueness_of :name
end