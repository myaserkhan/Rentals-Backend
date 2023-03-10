class User < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :name, presence: true
    validates :email, uniqueness: true
end
