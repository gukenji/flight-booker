# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

airports = Airport.create([
  {code: "GRU" , city: "São Paulo"} , {code: "ZRH" , city: "Zurique"} , {code: "NRT" , city: "Tóquio"} , {code: "MAD" , city: "Madrid"} , {code: "SYD" , city: "Sydney"} , 
  {code: "DFW" , city: "Dallas"} , {code: "LAX" , city: "Los Angeles"} , {code: "EZE" , city: "Buenos Aires"} , {code: "DOH" , city: "Doha"} , {code: "JNB" , city: "Joanesburgo"} ,
  {code: "BMA" , city: "Estocolmo"} , {code: "BRU" , city: "Bruxelas"} , {code: "FCO" , city: "Roma"} , {code: "FRA" , city: "Frankfurt"}
])

flights = Flight.create!([
  { departure_airport_id: 1, arrival_airport_id: 2, flight_duration: 90, start_datetime: "2022-12-01 19:00:00", max_passengers: 120 },
  { departure_airport_id: 2, arrival_airport_id: 3, flight_duration: 100, start_datetime: "2022-08-25 18:00:00", max_passengers: 120 },
  { departure_airport_id: 3, arrival_airport_id: 4, flight_duration: 120, start_datetime: "2022-06-01 12:30:00", max_passengers: 120 },
  { departure_airport_id: 4, arrival_airport_id: 5, flight_duration: 200, start_datetime: "2022-09-25 07:30:00", max_passengers: 120 },
  { departure_airport_id: 5, arrival_airport_id: 6, flight_duration: 300, start_datetime: "2022-08-29 15:00:00", max_passengers: 120 },
  { departure_airport_id: 1, arrival_airport_id: 2, flight_duration: 300, start_datetime: "2023-08-29 15:00:00", max_passengers: 120 }
])