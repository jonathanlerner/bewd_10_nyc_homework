class Rentals

	require 'json'
	require 'rest-client'

	attr_accessor :rent_res

	def initialize
		@rent_res = JSON.load(RestClient.get('http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=um3fb8zj36yrj4vaewyjvsnm'))
	end
  	
end