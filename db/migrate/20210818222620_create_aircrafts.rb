class CreateAircrafts < ActiveRecord::Migration[6.1]
  def change
    create_table :aircrafts do |t|
      t.string :brand, null: false
      t.string :model, null: false
      t.integer :capacity, null: false

      t.timestamps
    end
  end
end
