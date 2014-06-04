#This class houses a City's data from Weather Underground and all the methods associated with it

require 'json'
require 'rest-client'

class City
	attr_accessor :state, :city_name, :curr_temp, :curr_time

	def get_city_data
		#Ask a user for the location, test if it's valid input; if not try again, if so set the time and temp
		location_inquiry
		
		res = JSON.load(RestClient.get(wu_json_url))
		if res["current_observation"] == nil
			puts "That's not a valid State or City. Please try again.\n\n"
			self.get_city_data
		else
			@curr_temp = res["current_observation"]["temperature_string"]
			@curr_time = res["current_observation"]["local_time_rfc822"]
		end
	end

	def location_inquiry
		#Get a user's City/State
		puts "What state are you in? (use the two-letter abbreviation)\n"
		@state = gets.chomp.upcase
	
		puts "What city are you in?\n"
		@city_name = gets.chomp
	end


	def wu_json_url
		#Create WU url
		#My key is 3448aaf65efc20fe
		"http://api.wunderground.com/api/3448aaf65efc20fe/conditions/q/#{@state}/#{@city_name.gsub(" ","_")}.json"
	end

	def print_location_greeting
		puts "\nIn #{@city_name}, #{@state}:\n"
	end

	def print_time
		puts "The current date/time is: #{@curr_time}\n"
	end

	def print_temp
		puts "The current temperature is: #{@curr_temp}\n"
	end

end