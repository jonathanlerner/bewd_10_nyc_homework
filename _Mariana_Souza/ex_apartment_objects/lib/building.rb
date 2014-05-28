#Building Class
class Building
	attr_accessor :building_name, :building_address

	def initialize(building_name, building_address)
		@building_name = building_name
		@building_address = building_address
		end

	def apartments
		apartments = {}
		end

	# def view_apartments
	# 	apartments.each do |apartment|
	# 		puts "Apartment: #{apartment.name}"
	# 		puts "sqft: #{apt_sqft} \t Bedrooms: #{apt_bedrooms} \t Bathrooms: #{apt_bathrooms}"
	# end

end