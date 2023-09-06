class Book < ApplicationRecord
  validates :title, presence: true
  validates :isbn, uniqueness: true
  has_many :goals
end
