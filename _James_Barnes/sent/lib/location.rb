#location class
class Location
  attr_accessor :city, :latitude, :longitude

  def initialize(city, latitude, longitude)
    @city = city
    @latitude = latitude
    @longitude = longitude
  end
end