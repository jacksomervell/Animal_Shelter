class Shelter 

  attr_accessor :name, :clients

  def initialize(name)
    @name = name
    @clients = []
  end 


  def add_client(name, age, gender)
    clients << Client.new(name, age, gender)
  end

end