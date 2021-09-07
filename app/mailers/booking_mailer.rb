class BookingMailer < ApplicationMailer
  default from: 'examples@example.com'

  def itinerary
    @booking = params[:booking]
    mail(to: @booking.email, subject: 'skySurf itinerary')
  end
end
