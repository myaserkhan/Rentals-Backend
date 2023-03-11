class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :username, presence: true
  validates :email, uniqueness: true
end
