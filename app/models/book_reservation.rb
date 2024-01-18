class BookReservation < ApplicationRecord
  belongs_to :book
  belongs_to :reservation
end
