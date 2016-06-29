class ChangeNumberColumnTypeInCarriages < ActiveRecord::Migration
  def change
    change_column :carriages, :number, :integer
  end
end
