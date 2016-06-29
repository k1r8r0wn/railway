class AddMoreColumnsToCarriages < ActiveRecord::Migration
  def change
    change_table :carriages do |t|
      t.integer  :side_upper_berths
      t.integer  :side_lower_berths
      t.string   :number
    end
  end
end
