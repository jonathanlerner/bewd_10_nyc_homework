# key golnfTeAC9rf7RTwDzYzcA

class TacoClout

require 'rest-client'
require 'json'

attr_accessor :list

	def initialize
		@tacolist = []
	end


	def get_yelp(zip_code)

		url = "http://api.yelp.com/business_review_search?category=restaurants&limit=10&term=taco&ywsid=golnfTeAC9rf7RTwDzYzcA"
	 	zip = "&location=#{zip_code}"
	 	results = url+zip

		yelp = JSON.load(RestClient.get(results))

		yelp["businesses"].map do |biz|
			name = biz["name"]
			address = biz["address1"]
			rating = biz["avg_rating"]
			review_count = biz["review_count"]
			clout = (rating.to_i)*(review_count.to_i)
			taco_joint = {name: "#{name}", clout: "#{clout}".to_i, address: "#{address}"} 
			@tacolist << taco_joint	
		end
		
		sorted = @tacolist.sort_by do |hash| 
			hash[:clout]
		end
		
		sorted = sorted.reverse
		sorted.each do |x|
			puts "#{x['name']} at #{x['address']} with clout of #{x['clout']}."
		end
	end

end


