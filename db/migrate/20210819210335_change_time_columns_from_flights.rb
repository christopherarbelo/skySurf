class ChangeTimeColumnsFromFlights < ActiveRecord::Migration[6.1]
  def change
    remove_column(:flights, :departure_time)
    remove_column(:flights, :arrival_time)
    remove_column(:flights, :date)
    add_column(:flights, :departure_time, :datetime, null: false)
    add_column(:flights, :arrival_time, :datetime, null: false)
  end
end
