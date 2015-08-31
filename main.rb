require_relative 'clients'
require_relative 'animals'
require_relative 'shelter'

shelter = Shelter.new("Jack/'s Magical Menagerie")
# puts shelter.inspect

def menu
  puts `clear`
  puts '*' * 52
  puts "Welcome to Jack'/s Magical Menagerie".center 50
  puts '*' * 52
  puts '1: Add a new client'
  puts '2: Add an animal for adoption'
  puts '3: List animals in the shelter available for adoption'
  puts '4: List registered clients'
  puts 'q: Quit'
  print '-->'
  gets.chomp
end

response = menu

def list_clients shelter
  shelter.clients.each_with_index { |client, index| puts "#{index}: #{client.name}" }
end 

def list_animals client
  client.pets.each_with_index { |animal, index| puts "#{index}: #{animal.name}"}
end

while response.downcase != 'q'
  case response 
  when '1' 
    puts 'What is your name?'
    name = gets.chomp
    puts 'How old are you?'
    age = gets.to_i
    puts 'Male or female?'
    gender = gets.chomp
    shelter.add_client(name, age, gender)
    puts "#{name} has been added to the client list"
    gets

  when '2'
    puts 'What breed of animal would you like to add?'
    breed = gets.chomp
    puts 'What is the name of your animal?'
    name = gets.chomp
    puts 'How old is your animal?'
    age = gets.to_i
    puts 'Is your animal male or female?'
    gender = gets.chomp
    puts 'What is your animal\'s favourite toy?'
    toy = gets.chomp
    animal = Animal.new(name, breed, age, gender, toy)
    puts "What client do you want #{name} to be added to?"
    list_clients(shelter)
    client_number = gets.to_i
    client = shelter.clients[client_number]
    client.add_animal(animal)
    puts "#{name} has been added to #{client.name}"
    gets

  when '3'
    puts 'What client do you want to list pets from?'
    list_clients(shelter)
    #choose a flight
    client_number = gets.to_i
    client = shelter.clients[client_number]
    #loop through passengers:
    puts "The pets for this client are:"
    list_animals(client)   
    gets 

  when '4'
    puts 'Here are all of the clients: '
          list_clients(shelter)
          gets

  end 

  response = menu

end

