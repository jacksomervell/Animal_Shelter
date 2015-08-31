class Shelter 

  attr_reader :name 
  attr_accessor :clients

  def initialize(name)
    @name = name
    @clients = []
  end 


  def add_client(name, age, gender, pets)
    client << Client.new
  end

end