class Search

	include ActiveModel::Model

	attr_accessor :departure_station_id, :arrival_station_id
	attr_reader :result

	validates :departure_station_id, :arrival_station_id, presence: true

	def departure_station
		@departure_station ||= RailwayStation.find(departure_station_id)
	end 

	def arrival_station
		@arrival_station ||= RailwayStation.find(arrival_station_id)
	end

	def perform_search
		@result = Train.includes(route: :railway_stations).where(railway_stations: {id: departure_station_id}) & 
		Train.includes(route: :railway_stations).where(railway_stations: {id: arrival_station_id})
	end

end