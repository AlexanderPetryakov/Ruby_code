class AddStationNumberColumnToStationRoutes < ActiveRecord::Migration[5.0]
  def change
    change_table :railway_stations_routes do |t|
      t.integer :station_number
    end
  end
end
