class PassengerMailer < ApplicationMailer
  default from: 'contact@flightbook.com'

  def book_confirmation_email(passenger,booking)
    @passenger = passenger
    @booking = booking
    mail(to: @passenger.email, subject: "Here's your book confirmation")

  end

end
