require_relative 'lib/portrait'
require_relative 'lib/weather.rb'
require "colorize"
require 'json'
require 'open-uri'
require 'rest-client'

puts "Welcome to the City Weather Viewer!".colorize(:yellow)

find_weather = "y"

while find_weather == "y"
	puts "Enter a city:"
		what_city = gets.chomp.downcase.tr(" ", "_")
	weather_report = Weather.new(what_city)
	weather_report.get_weather
	puts "\n Try another city? y or n"
		find_weather = gets.chomp
end