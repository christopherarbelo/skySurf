class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.string :email, null: false

      t.timestamps
    end
  end
end
