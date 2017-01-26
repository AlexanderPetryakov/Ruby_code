class Wagon < ApplicationRecord

	belongs_to :train, optional: true

	validates :car_type, presence: true
	validates :low_seat_num, presence: true
	validates :up_seat_num, presence: true
end
