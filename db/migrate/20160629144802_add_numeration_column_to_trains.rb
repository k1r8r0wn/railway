class AddNumerationColumnToTrains < ActiveRecord::Migration
  def change
    add_column :trains, :numeration, :boolean, default: true
  end
end
