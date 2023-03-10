class User < ApplicationRecord
    has_many :reservations, dependent: :destroy
end
