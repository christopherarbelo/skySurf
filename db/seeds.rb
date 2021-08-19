Airport.destroy_all
Aircraft.destroy_all

jfk = Airport.create(code: 'JFK', name: 'John F. Kennedy International', location: 'New York, NY')
lax = Airport.create(code: 'LAX', name: 'Los Angeles International Airport', location: 'Los Angeles, CA')
a320_1 = Aircraft.create(brand: 'Airbus', model: 'a320neo', capacity: 180)
