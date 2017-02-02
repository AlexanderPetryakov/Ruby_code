class RailwayStation < ApplicationRecord
  
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> (route) { joins(:railway_stations_routes).where( "railway_stations_routes.route_id = ?", route ).order("railway_stations_routes.station_number") }
end
