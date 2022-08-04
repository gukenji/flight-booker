class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order(start_datetime: :asc)
    @date_options = @flights.all.map {|f| [Flight.flight_date_formatted(f.start_datetime), f.start_datetime]}
    @arrival_options = Flight.all.map {|f| [Airport.find(f.arrival_airport_id).city, Airport.find(f.arrival_airport_id).code]}
    @departure_options = Flight.all.map {|f| [Airport.find(f.departure_airport_id).city, Airport.find(f.departure_airport_id).code]}
    @flight_list = Flight.search(params[:departure_code], params[:arrival_code], params[:date])


  end



end
