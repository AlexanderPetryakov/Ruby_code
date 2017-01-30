class Train < ApplicationRecord
  
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def wagon_count(car_type)
    counter = 0
    self.wagons.each do |wagon|
      counter += 1 if wagon.car_type == car_type
    end
    counter
  end

  def seat_count(car_type, seat_type)
    counter = 0
    if seat_type == "верхние"
      self.wagons.each do |wagon|
        counter += wagon.up_seat_num if wagon.car_type == car_type
      end
    else
      self.wagons.each do |wagon|
        counter += wagon.low_seat_num if wagon.car_type == car_type
      end
    end
    counter
  end  

end
