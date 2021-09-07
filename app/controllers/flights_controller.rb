class FlightsController < ApplicationController  
  def home
    @airports = Airport.all.map { |airport| ["#{airport.location} (#{airport.code})", airport.id]}
    @trips = [["One Way", "one-way"]]
    @passengers = [['1 traveler', 1], ['2 travelers', 2], ['3 travelers', 3], ['4 travelers', 4]]
  end

  def flights
    @flight_search_params = flight_search_params
    @flights = Flight.includes(:aircraft, :origin, :destination).where(flight_search_basic(flight_search_params))

    flash[:alert] = 'There are no flights for that search!' and redirect_to root_path if @flights.none?
  end

  private

  def flight_search_params
    params.permit(:origin, :destination, :date, :trip, :passengers)
  end

  def flight_search_basic(flight_params)
    flight_params.select {|key, _v| [:aircraft, :origin, :destination].include? key }
  end
end
