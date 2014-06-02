class BoxOffice

	require 'json'
	require 'rest-client'

	attr_accessor :box_res

	def initialize
		@box_res = JSON.load(RestClient.get('http://api.rottentomatoes.com/api/public/v1.0/lists/movies/box_office.json?apikey=um3fb8zj36yrj4vaewyjvsnm'))
	end
  	
end

