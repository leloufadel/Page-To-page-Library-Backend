class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :jwt_authenticatable,
  jwt_revocation_strategy: JwtDenylist

  has_many :books, foreign_key: :user_id
  has_many :reservations, foreign_key: :user_id

  validates :name, presence: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }
end
