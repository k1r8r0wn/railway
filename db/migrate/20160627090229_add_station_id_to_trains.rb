class AddStationIdToTrains < ActiveRecord::Migration
  def change
    # add_column :trains, :current_station_id, :integer
    add_belongs_to :trains, :current_station
  end
end
