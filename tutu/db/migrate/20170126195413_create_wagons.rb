class CreateWagons < ActiveRecord::Migration[5.0]
  def change
    create_table :wagons do |t|
      t.string :car_type
      t.integer :up_seat_num
      t.integer :low_seat_num

      t.timestamps
    end
  end
end
