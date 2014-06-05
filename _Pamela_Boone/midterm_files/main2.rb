# Create a command line based application that fulfills these criteria:

# Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
# Connects to a 3rd party api where the call varies based on what the user gives you.
# Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
# Push code on Github.

###################################################
#Get user to input a value and check for validity
#Create lib and require_relative link

# require_relative 'mashable4'
require_relative 'run'
require_relative 'person'

# put code here ask the user for their name, and save it
puts "What is your name?"
person = Person.new(gets.strip)


game = Run.new(person).play
# run.play
# game.play