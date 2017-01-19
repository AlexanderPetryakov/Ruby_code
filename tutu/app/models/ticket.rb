class Ticket < ApplicationRecord

  belongs_to :train
  belongs_to :departure_station, class_name: 'RailwayStation', foreign_key: :departure_station_id
  belongs_to :arrival_station, class_name: 'RailwayStation', foreign_key: :arrival_station_id
  belongs_to :user
end
