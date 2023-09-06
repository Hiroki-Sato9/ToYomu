class Book < ApplicationRecord
  validates :title, presence: true
  validates :isbn, uniqueness: true

end
