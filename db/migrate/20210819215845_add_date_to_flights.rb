class AddDateToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :date, :date, null: false
  end
end
