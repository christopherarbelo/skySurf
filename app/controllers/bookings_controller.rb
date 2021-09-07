class BookingsController < ApplicationController
  def show
    @booking = Booking.includes(flight: [:aircraft, :origin, :destination]).find(params[:id])
  end
  
  def new
    @flight = Flight.find(params[:flight_id])
    @passenger_count = params[:passengers].to_i
    if @flight && @passenger_count.positive?
      @booking = Booking.new
      @passenger_count.times { @booking.passengers.build }
    else
      flash[:alert] = 'Something went wrong.'
      redirect_to root_path
    end
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      flash[:notice] = 'Horay! You\'re all set!'
      redirect_to booking_path(@booking.id)
    else
      flash[:alert] = 'Something went wrong'
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:email, :flight_id, passengers_attributes: [:id, :name])
  end
end
