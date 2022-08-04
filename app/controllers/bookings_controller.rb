class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight_id]
    @ticket_number = params[:num_ticket]
    @booking = Booking.new
    @ticket_number.to_i.times { @booking.passengers.build } 
    
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to root_path, notice: 'Convite enviado com sucesso!' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end
