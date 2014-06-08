
# TACO CLOUT uses Yelp API to find tacos in your zip code. 
# Taco clout based on number of reviews times average rating.
#http://www.yelp.com/developers/documentation/search_api


require_relative 'midterm'

# running program
puts "************* Welcome to Taco Clout ************* \n \n"

puts "Welcome to Taco Clout - enter your zip and recieve a list of 10 tacos joints and yelp clouts. \n \n"

puts "What is your zip code?"
	zip_code = gets.to_i

puts "\n"

t1 = TacoClout.new 
t1.get_yelp(zip_code)