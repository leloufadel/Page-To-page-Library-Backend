class User < ApplicationRecord
  has_many :books, foreign_key: :user_id
  has_many :reservations, foreign_key: :user_id

  validates :name, presence: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }
end
