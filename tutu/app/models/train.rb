class Train < ApplicationRecord
  
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def seat_count(type, seat_type)
    wagons.where(type: type).sum(seat_type)
  end 

end
