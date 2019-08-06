require 'pry'

class Pet
  attr_reader :breed, :gender #:name, :age
  # attr_writer :age, :name
  attr_accessor :name, :age

  # @instance_variable
  # local_variable

  def initialize(name, breed, age, gender)
    @name = name
    @breed = breed
    @age = age
    @gender = gender
    # @location = location
  end

  # def name
  #   return @name
  # end
  #
  # def name=(name)
  #   @name = name
  # end


  #
  # def breed
  #   @breed
  # end
  #
  # def age
  #   @age
  # end
  #
  # def age=(age)
  #   @age = age
  # end
  #
  # def gender
  #   @gender
  # end

end

grace_pet = {
  name: "melodie",
  breed: "toy poodle",
  age: 13,
  gender: "female"
}

marisa_pet = {
  name: "Callie",
  breed: "maltese",
  age: 4,
  gender: "female"
}

megan_pet = {
  name: "Patron",
  breed: "chuhuahua",
  age: 10,
  gender: "male"
}

megan_pet2 = {
  name: "Papyrus",
  breed: "calico",
  age: 11,
  gender: "female"
}

grace_pet_obj = Pet.new("melodie", "toy_poodle", 13, "female")


students_pets = [grace_pet,marisa_pet,megan_pet,megan_pet2]
Pry.start
0
