class AddDepartureAndDestinationStationsToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :departure_station
    add_belongs_to :tickets, :destination_station
  end
end
