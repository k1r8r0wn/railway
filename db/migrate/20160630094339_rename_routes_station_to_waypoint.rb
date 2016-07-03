class RenameRoutesStationToWaypoint < ActiveRecord::Migration
  def change
    rename_table :routes_stations, :waypoints
  end
end
