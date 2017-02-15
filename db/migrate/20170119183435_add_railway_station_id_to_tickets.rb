class AddRailwayStationIdToTickets < ActiveRecord::Migration[5.0]
  def change

    add_belongs_to :tickets, :departure_station
    add_belongs_to :tickets, :arrival_station
  end
end
