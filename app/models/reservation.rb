class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :city_name, presence: true
  validates :date, presence: true
end
