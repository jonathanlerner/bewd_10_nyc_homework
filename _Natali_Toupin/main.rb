# => The purpose of this exercise is to practice creating classes.
  # Exercise Goal: This is an exercise in reading and writing code.
# Task Instructions:
# => The main.rb file is where the application starts, and we've given you the code below.
# => Your job is to write the "Apartment", "Building" and "Person" classes.
# => Read the code below and use it to inform what variables and methods are necessary for each of the classes listed above.
# => We've also provided a png file of the terminal output from the completed version.
# => Hint: Think before you code. Annotate code and comment out sections as you test different sections

require_relative 'lib/building'
require_relative 'lib/apartment'
require_relative 'lib/person'


## First, define our methods
class Apartment
  attr_accessor :name, :apt_sqft, :apt_bedrooms, :apt_bathrooms, :building, :renter, :rent
  
  def initialize(name, apt_sqft, apt_bedrooms, apt_bathrooms, building, renter, rent)
    @name = name
    @apt_sqft = apt_sqft 
    @apt_bedrooms = apt_bedrooms
    @apt_bathrooms = apt_bathrooms
    @building = building
    @renter = renter
    @rent = rent
  end
    def create_renter
    puts "-----------New Renter-----------"
    puts "What is the renter's name?"
    name = gets.strip 

    puts "What is the #{name}'s credit score?"
    credit_score = gets.to_i

    puts "Is #{name} male or female?"
    gender = gets.strip

    Person.new(name, credit_score, gender, self)
  end
end

class Person
  attr_accessor :name, :credit_score, :gender, :apartment

  def initialize(name, credit_score, gender, apartment)
    @name = name
    @credit_score = name
    @gender = gender
    @apartment = apartment
  end
end

class Building
  attr_accessor :building_name, :building_address, :apartments
  

  def initialize(building_name, building_address, apartments)
    @building_name = building_name
    @building_address = building_address
    @apartments = apartments
  end

  def self.create_building
    puts "-----------New Building-----------"
    puts "What is the building's name?"
    building_name = gets.strip

    puts "What is the building's address?"
    building_address = gets.strip

    Building.new(building_name, building_address, [])
  end

  def create_apartment
    puts "-----------New Apartment-----------"
    puts "What is the apartment number / name?"
    name = gets.strip

    puts "How many square feet is apartment #{name}?"
    apt_sqft = gets.to_i

    puts "How many bedrooms does apartment #{name} have?"
    apt_bedrooms = gets.to_i

    puts "How many bathrooms does apartment #{name} have?"
    apt_bathrooms = gets.to_i

    Apartment.new(name, apt_sqft, apt_bedrooms, apt_bathrooms, self, [], nil)
  end
end


# Now call methods to run the program

puts "******************Welcome to Ruby Building Manager****************** \n \n \n"

building = Building.create_building

puts "How many units are there?"
apt_count = gets.to_i

 0.upto(apt_count - 1) do |unit|
  apartment = building.create_apartment
  building.apartments[unit] = apartment

  puts "Apartment added successfully \n #{apartment}"

  puts "Is unit #{apartment.name} rented? (y)es (n)o"
  unit_rented = gets.strip

  if unit_rented == "y"
    apartment.renter = apartment.create_renter
    puts "Renter added successfully"

    puts "How much is this unit rented for?"
    rent = gets.to_i
    apartment.rent = rent
  end
end

puts "What would you like to do next, (v)iew all apartments? (q)uit?"
response = gets.strip

if response == 'v'
  building.view_apartments
else
  puts "Thanks for using Ruby Building Manager"
end






