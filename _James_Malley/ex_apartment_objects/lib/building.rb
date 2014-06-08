#Building Class
class Building
	attr_accessor :building_name, :building_address, :apartments, :apt_count

	def initialize (building_name, building_address)
		@building_name = building_name
		@building_address = building_address
		@apartments = []
	end

	def view_apartments
		puts @apartments
	end

end
