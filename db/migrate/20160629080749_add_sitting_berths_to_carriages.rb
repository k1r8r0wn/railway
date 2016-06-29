class AddSittingBerthsToCarriages < ActiveRecord::Migration
  def change
    add_column :carriages, :sitting_berths, :integer
  end
end
