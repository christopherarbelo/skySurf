class ApplicationController < ActionController::Base
  helper_method :format_flight_time, :format_flight_duration
  
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
end
