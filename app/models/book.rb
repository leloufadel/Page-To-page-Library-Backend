class Book < ApplicationRecord
  has_many :book_reservations
  has_many :reservations, through: :book_reservations

  validates :name, presence: true
  validates :cover_photo, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :publish_date, presence: true
end
