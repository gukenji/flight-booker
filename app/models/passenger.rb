class Passenger < ApplicationRecord
  belongs_to :booking, class_name: 'Booking' , optional: true
  has_one :flight, class_name: "Flight", through: :booking
end
