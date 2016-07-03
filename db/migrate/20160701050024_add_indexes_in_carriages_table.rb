class AddIndexesInCarriagesTable < ActiveRecord::Migration
  def change
    add_index :carriages, [:train_id, :number], unique: true
  end
end
