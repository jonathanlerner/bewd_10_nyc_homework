#Jonathan Lerner
#This application takes in a user's city and returns the current temperature

#MY KEY: 3448aaf65efc20fe

require_relative 'lib/city'


puts "\n\nWelcome to Jonathan Lerner's Weather Program.\n"
puts "You tell me your city in the United States, I'll tell you the current date, time, and temperature! It's magic!\n\n"

retrieve = "Y"

while (retrieve == "Y")
	#Go create a new city, get it's temperature, print it out
	this_city = City.new
	this_city.get_city_data
	this_city.print_location_greeting
	this_city.print_time
	this_city.print_temp

	begin
		puts "Would you like to see the temperature in another city? Type Y for yes, N for no.\n"
		retrieve = $stdin.gets.chomp.upcase
	end until ((retrieve == "Y") | (retrieve == "N"))
end

puts "Enjoy the weather!"