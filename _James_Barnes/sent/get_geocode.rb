require 'geocoder'
require_relative 'lib/location'

def get_address
  puts "What is your location?"
  user_location = gets.chomp
  adr = Geocoder.search(user_location)[0]
  city = adr.city
  lat = adr.latitude
  lon = adr.longitude
  loc = Location.new(city,lat,lon)
  puts "It looks like you're in #{loc.city}, at latitude #{loc.latitude} and longitude #{loc.longitude}."
end

loc = get_address

puts loc