
# This is the main file that will call all classes

require_relative 'lib/box_office'
require_relative 'lib/rentals.rb'
require_relative 'lib/user'

# THE FOLLOWING FUNCTIONS APPLY TO THE BOX OFFICE AND TOP RENTAL API's FROM ROTTEN TOMATOES

# show_all_ratings returns the title and rating information for all current box office listings

def show_all_ratings(movies)
  movies.map do |movie|
    "Movie: #{movie[:title]}\nCritical Rating: #{movie[:critical]}, Fan Rating: #{movie[:fans]}\n\n"
  end
end

# get movie_details extracts 

def get_movie_details(box_office)
  box_office["movies"].map do |movie|
    r = {title: movie["title"], summary: movie["synopsis"], critical: movie["ratings"]["critics_rating"], fans: movie["ratings"]["audience_rating"]} 
    r
  end  
end

# Greet user and capture user name

puts "Welcome to our Rotten Tomatoes search. We're going to let you access one of two Rotten Tomatoes API's 
to retrieve information about current box office listings or historical movie statistics.\n"
puts "Can you begin by telling us your name?"
user = User.new(gets.strip)

# Ask user which API they would like to investigate and check for bad data

puts "Welcome #{user.name}."
breakloop = "N" # introduce variable to continue until correct input is received
while breakloop == "N"
	puts "Would you like to see ratings of the top box office hits (enter 'BOX') or top rentals (enter 'RENT')"
	api_branch= gets.strip
	if api_branch == "RENT" or api_branch == "BOX"
		if api_branch == "BOX"
			box_office = BoxOffice.new
			listings = get_movie_details box_office.box_res
			puts show_all_ratings listings
			breakloop = "Y"
		else 
			top_rentals = Rentals.new
			listings = get_movie_details top_rentals.rent_res
			puts show_all_ratings listings
			breakloop = "Y"
		end
	else
		puts "Wrong input. Please try again"
	end
end


