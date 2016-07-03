class AddArrivalTimeAndDepartureTimeColumnsToRoutesStation < ActiveRecord::Migration
  def change
    change_table :routes_stations do |t|
      t.datetime :arrival_time
      t.datetime :departure_time
    end
  end
end
