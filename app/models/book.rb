class Book < ApplicationRecord
    belongs_to :user, foreign_key: :user_id
    has_many :book_reservations
    has_many :reservations, through: :book_reservations
end
