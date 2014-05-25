#location class
class Location
  attr_accessor :city, :lat, :lon

  def get_address
    puts "What is your location?"
    user_location = gets.chomp
    adr = Geocoder.search(user_location)[0]
    @city = adr.city
    @lat = adr.latitude
    @lon = adr.longitude
  end

  def confirm_location
    puts "It looks like you're in #{@city}, at latitude #{@lat} and longitude #{@lon}."
  end
end
