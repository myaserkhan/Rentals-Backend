class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :username, presence: true, format: { without: /\s/, message: "Username must not contain spaces" }
  validates :email, uniqueness: true
end
