class Wagon < ApplicationRecord

  belongs_to :train, optional: true

  validates :car_type, :low_seat_num, :up_seat_num, presence: true

end
