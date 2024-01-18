class Book < ApplicationRecord
    has_many :book_reservations
    has_many :reservations, through: :book_reservations
end
