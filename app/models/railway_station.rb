class RailwayStation < ApplicationRecord
  
  has_many :trains, foreign_key: :current_station_id
  has_many :railway_stations_routes, dependent: :destroy
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.station_number').joins(:railway_stations_routes).order("railway_stations_routes.station_number").uniq }
  #scope :ordered, -> (route) { joins(:railway_stations_routes).where( "railway_stations_routes.route_id = ?", route ).order("railway_stations_routes.station_number") }

  def update_number(route, number)
    station_route = station_route(route)
    station_route.update(station_number: number) if station_route
  end

  def number_in(route)
    station_route(route).try(:station_number)
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route.update(arrival_time: arrival_time, departure_time: departure_time) if station_route
  end

  def time_in(route, time)
    station_route(route).try(time)
  end

  protected

  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end

end
