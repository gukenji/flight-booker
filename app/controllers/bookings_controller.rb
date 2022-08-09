class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight_id]
    @ticket_number = params[:num_ticket]
    @booking = Booking.new
    @ticket_number.to_i.times { @booking.passengers.build } 
    @code = "OA#{rand(100..999)}"
    
  end

  def create
    @flight_id = params[:flight_id]
    @booking = Booking.new(booking_params)
    @code = params[:code]
    respond_to do |format|
      if @booking.save!
        format.html { redirect_to booking_path(id: @booking.id, code: @code), notice: 'Reserva efetuada com sucesso!' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  def show
    @booking = Booking.find(params[:id])
    @code = params[:code]
    @flight = Flight.find (@booking.flight_id)
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
