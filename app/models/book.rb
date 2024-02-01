class Book < ApplicationRecord
  has_many :book_reservations
  has_many :reservations, through: :book_reservations

  validates :name, presence: true, length: { minimum: 3 }
  validates :cover_photo, presence: true, length: { minimum: 3 }
  validates :author, presence: true, length: { minimum: 3 }
  validates :publisher, presence: true, length: { minimum: 3 }
  validates :publish_date, presence: true
end
