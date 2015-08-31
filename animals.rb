class Animal

attr_reader :name
attr_accessor :breed, :age, :gender, :toy

def initialize (name, breed, age, gender, toy)
  @name = name
  @breed = breed
  @age = age
  @gender = gender
  @toy = toy
end

end