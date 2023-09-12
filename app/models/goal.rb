class Goal < ApplicationRecord
  belongs_to :user
  belongs_to :book
  default_scope -> { order(date: :desc) }
  validates :user, presence: true
  validates :book, presence: true
  validates :date, presence: true
end
