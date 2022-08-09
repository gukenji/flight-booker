class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: 'Airport', foreign_key: :departure_airport_id
  belongs_to :arrival_airport, class_name: 'Airport', foreign_key: :arrival_airport_id

  has_many :bookings, class_name: 'Booking', foreign_key: :flight_id
  has_many :passengers, :through => :bookings


  def self.flight_date_formatted(date)
    date.strftime('%d/%m/%Y')
  end

  def self.flight_duration_formatted(time)
    hours = time/60
    minutes = time - hours * 60
    if hours > 0 && minutes > 0 
      formatted_duration = hours.to_s + " hours and " + minutes.to_s + " minutes " 
    elsif hours > 0 && minutes <= 0
      formatted_duration = hours.to_s + " hours"
    elsif hours <= 0 && minutes >= 0
      formatted_duration = minutes.to_s + " minutes"
    else
      formatted_duration = "duracao desconhecida."
    end
  end

  def self.flight_hour_formatted(date)
    date.strftime('%H:%M')
  end

  def self.search(departure_code, arrival_code, date)
    if departure_code
      departure_id = Airport.find_by(code: departure_code)
      arrival_id = Airport.find_by(code: arrival_code)
      formated_date = date.to_datetime
      flights = Flight.where('departure_airport_id = ?', departure_id).where('arrival_airport_id = ?', arrival_id).where(
        'start_datetime = ?', formated_date
      )
    end
  end
end
