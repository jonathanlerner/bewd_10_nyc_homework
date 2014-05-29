#Building Class
class Building
	attr_accessor :building_name, :building_address

	def initialize(building_name, building_address)
  		@building_name= building_name
  		@building_address = building_address
		# @all_apartments = []
	end

end
