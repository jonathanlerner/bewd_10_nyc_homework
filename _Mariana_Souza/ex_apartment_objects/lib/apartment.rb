#Apartment class.
class Apartment
	attr_accessor :name, :apt_sqft, :apt_bedrooms, :apt_bathrooms


	def initialize(name, apt_sqft, apt_bedrooms, apt_bathrooms)
		@name = name
		@apt_sqft = apt_sqft
		@apt_bedrooms = apt_bedrooms
		@apt_bathrooms = apt_bathrooms
	end

	def renter (name, credit_score, gender)
		renter = Person.new
		# renter = {name: "#{name}", credit_score: "#{credit_score}", gender: "#{gender}"}
	end



# def apartment
# 	puts "Unit #{name} is #{apt_sqft}square feet, has #{apt_bedrooms} bedrooms, and #{apt_bathrooms} bathrooms."
# end

end