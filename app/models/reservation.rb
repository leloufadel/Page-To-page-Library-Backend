class Reservation < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :book_reservations
  has_many :books, through: :book_reservations

  validates :date, presence: true
  validates :city, presence: true, length: { minimum: 3 }
  validates :due_date, presence: true
end
