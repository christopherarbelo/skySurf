class FlightsController < ApplicationController
  helper_method :format_flight_time, :format_flight_duration
  
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

  def format_flight_duration(minutes)
    "#{(minutes / 3600).to_i} hr #{((minutes % 3600) / 60).to_i} min"
  end

  def format_flight_time(flight_time)
    time = flight_time.to_s(:flight_time).split(':')
    hour = time.first.to_i
    min = time.last.ljust(2, '0')

    denomination = 'AM'
    if hour.zero?
      adjusted_hour = 12
    elsif hour > 12
      adjusted_hour = hour % 12
      denomination = 'PM'
    else
      adjusted_hour = hour
    end

    "#{adjusted_hour}:#{min} #{denomination}"
  end

  def flight_search_params
    params.permit(:origin, :destination, :date, :trip, :passengers)
  end

  def flight_search_basic(flight_params)
    flight_params.select {|key, _v| [:aircraft, :origin, :destination].include? key }
  end
end
