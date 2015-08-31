class Client

  attr_reader :name
  attr_accessor :pets, :age, :gender
 
 def initialize (name, age, gender)
  @name = name
  @age = age
  @gender = gender
  @pets= []
 end 

 # def to_s
 #  "#{destination} with #{number_of_seats} passengers" 
 # end

 def add_animal animal
    @pets << animal
  end
end
