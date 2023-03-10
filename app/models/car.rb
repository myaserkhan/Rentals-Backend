class Car < ApplicationRecord
    has_many :reservations, dependent: :destroy

    validates :name, presence: true
    validates :description, presence: true    
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :duration, numericality: { greater_than: 0 }
    validates :imgurl, presence: true  
    validates :brand, presence: true

end
