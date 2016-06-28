class CreateCarriages < ActiveRecord::Migration
  def change
    create_table :carriages do |t|
      t.string  :carriage_type
      t.integer :upper_berths
      t.integer :lower_berths
      t.integer :train_id

      t.timestamps null: false
    end
  end
end
