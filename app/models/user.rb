class User < ApplicationRecord
  has_many :books, foreign_key: :user_id
  has_many :reservations, foreign_key: :user_id

  validates :name, presence: true
  validates :password, presence: true
end
