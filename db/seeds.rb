Flight.destroy_all
Airport.destroy_all
Aircraft.destroy_all

# Airports
jfk = Airport.create(code: 'JFK', name: 'John F. Kennedy International', location: 'New York, NY')
lax = Airport.create(code: 'LAX', name: 'Los Angeles International Airport', location: 'Los Angeles, CA')
sfo = Airport.create(code: 'SFO', name: 'San Francisco Airport', location: 'San Francisco, CA')
fll = Airport.create(code: 'fll', name: 'Fort Lauderdale Airport', location: 'Fort Lauderdale, FL')
mia = Airport.create(code: 'mia', name: 'Miami International Airport', location: 'Miami, FL')

# Aircraft
a320_1 = Aircraft.create(brand: 'Airbus', model: 'a320neo', capacity: 180)
a320_2 = Aircraft.create(brand: 'Airbus', model: 'a320neo', capacity: 180)
a321_1 = Aircraft.create(brand: 'Airbus', model: 'a321neo', capacity: 220)

# Flights
flight_one = Flight.create(aircraft_id: a320_1.id, origin_id: jfk.id, destination_id: lax.id, date: Date.new(2021, 8, 29),
                           departure_time: DateTime.new(2021, 8, 29, 13, 35), 
                           arrival_time: DateTime.new(2021, 8, 29, 16, 15))
flight_two = Flight.create(aircraft_id: a321_1.id, origin_id: jfk.id, destination_id: lax.id, date: Date.new(2021, 8, 29),
                           departure_time: DateTime.new(2021, 8, 29, 15, 45), 
                           arrival_time: DateTime.new(2021, 8, 29, 18, 10))
