class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :aircraft, null: false, foreign_key: true
      t.references :origin, null: false, foreign_key: { to_table: :airports }
      t.references :destination, null: false, foreign_key: { to_table: :airports }
      t.time :departure_time
      t.time :arrival_time
      t.date :date

      t.timestamps
    end
  end
end
