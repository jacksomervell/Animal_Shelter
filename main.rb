require_relative 'clients'
require_relative 'animals'
require_relative 'shelter'

shelter = Shelter.new("Jack/'s Magical Menagerie")
puts shelter.inspect

def menu
  puts `clear`
  puts '*' * 52
  puts "Welcome to Jack'/s Magical Menagerie".center 50
  puts '*' * 52
  puts '1: Add an animal for adoption'
  puts '2: List animals in the shelter available for adoption'
  puts '3: Add a new client'
  puts '4: List registered clients'
  puts 'q: Quit'
  print '-->'
  gets.chomp
end

response = menu

def list_flights airport
  airport.flights.each_with_index { |flight, index| puts "#{index}: #{flight}" }
end 

def list_passengers flight
  flight.passengers.each_with_index { |passenger, index| puts "#{index}: #{passenger.name}"}
end

while response.downcase != 'q'
  case response 
  when '1' #Add an animal
    puts 'How many passengers on this flight?'
    number_of_seats = gets.to_i
    puts 'What is the flights destination?'
    destination = gets.chomp
    puts airport.add_flight(number_of_seats, destination)
    gets
  when '2'
    puts 'Here are all of the flights: '
          list_flights(airport)
          gets
  when '3'
    puts 'What is the passenger\'s name?'
    name = gets.chomp
    passenger = Passenger.new(name)
    puts "What flight do you want #{passenger.name} to be added to?"
    list_flights(airport)

    flight_number = gets.to_i
    flight = airport.flights[flight_number]

    flight.add_passenger(passenger)
    puts "#{passenger.name} has been added to #{flight}"
    gets
  when '4'
    puts 'What flight do you want to list passengers from?'
    list_flights(airport)
    #choose a flight
    flight_number = gets.to_i
    flight = airport.flights[flight_number]
    #loop through passengers:
    puts "The passengers for this flight are:"
    list_passengers(flight)   
    gets 
  end 

  response = menu

end

