class CreateRoutesStations < ActiveRecord::Migration
  def change
    create_table :routes_stations do |t|
      t.integer :route_id
      t.integer :station_id
    end
  end
end
