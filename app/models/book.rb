class Book < ApplicationRecord
  has_many :goals
  validates :title, presence: true
  validates :isbn, uniqueness: true
end
