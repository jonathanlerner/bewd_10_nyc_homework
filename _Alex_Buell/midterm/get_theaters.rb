require 'rest-client'
require 'json'

class GetTheaters

	#gets data from user input of CollectInfo class
	attr_accessor :data

	def initialize(data)
		@data = data
	end

	#makes the API call with the data
	def get_stuff
		@theaters = []

		places = JSON.load(RestClient.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=movie+theaters+in+#{@data}&radius=5000&sensor=true&key=AIzaSyDiUzzuEDqN1x-VQzlNOS2MLWZXw-Zt2PM"))

		places['results'].map do |theater|
			attributes = {name: theater['name']}
	
			@theaters.push(attributes[:name])
		end

		eval_data
	end

	#returns data to the user!
	def eval_data
		if @theaters.empty?
			puts "No results!  Please make sure your city/zip code actually exists!"
		else
			puts "Here are your theaters!"
			puts @theaters
		end
	end
end