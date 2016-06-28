class AddPassengerNameToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :passenger_name, :string
  end
end
