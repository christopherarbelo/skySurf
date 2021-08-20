class FlightsController < ApplicationController
  helper_method :format_flight_time, :format_flight_duration
  
  def home
    @airports = Airport.all.map { |airport| [airport.name, airport.id]}
  end

  def flights
    @flights = Flight.includes(:aircraft, :origin, :destination).where(flight_search_params)
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
    params.permit(:origin, :destination, :date)
  end
end
