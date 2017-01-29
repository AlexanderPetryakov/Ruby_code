class Train < ApplicationRecord
  
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  belongs_to :route, optional: true
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def kup_count
    kup_count = 0
    self.wagons.each do |wagon|
      kup_count += 1 if wagon.car_type == "Купейный"
    end
    kup_count
  end

  def up_seat_kup_count
    up_seat_kup_count = 0
    self.wagons.each do |wagon|
      up_seat_kup_count += wagon.up_seat_num if wagon.car_type == "Купейный"
    end
    up_seat_kup_count
  end  

  def low_seat_kup_count
    low_seat_kup_count = 0
    self.wagons.each do |wagon|
      low_seat_kup_count += wagon.low_seat_num if wagon.car_type == "Купейный"
    end
    low_seat_kup_count
  end

  def plz_count
    plz_count = 0
    self.wagons.each do |wagon|
      plz_count += 1 if wagon.car_type == "Плацкартный"
    end
    plz_count
  end

  def up_seat_plz_count
    up_seat_plz_count = 0
    self.wagons.each do |wagon|
      up_seat_plz_count += wagon.up_seat_num if wagon.car_type == "Плацкартный"
    end
    up_seat_plz_count
  end

  def low_seat_plz_count
    low_seat_plz_count = 0
    self.wagons.each do |wagon|
      low_seat_plz_count += wagon.low_seat_num if wagon.car_type == "Плацкартный"
    end
    low_seat_plz_count
  end

end
