require_relative 'lib/portrait'
require "colorize"
require 'json'
require 'open-uri'
require 'rest-client'

def get_weather(city)

	url = "http://api.openweathermap.org/data/2.5/find?q=#{city}&mode=json&units=imperial"
	res = JSON.load(RestClient.get(url))

	condition = res['list'].first['weather'].first['main']
	temp =		res['list'].first['main']['temp']
	puts "In #{city}, it's a balmy #{temp} degrees, and #{condition}".colorize(:green)
	if condition.downcase.include? "rain"
		pic = Portrait.new("rain")
		pic.rain
	elsif condition.downcase.include? "cloud"
		pic = Portrait.new("clouds")
		pic.clouds
	elsif condition.downcase.include? "clear"
		pic = Portrait.new("clear")
		pic.clear
	else
		puts "#{condition}?"
		puts "Unknown weather. Stay indoors.".red.blink
	end
end


puts "Welcome to the City Weather Viewer!".colorize(:yellow)

find_weather = "y"


while find_weather == "y"
	puts "Enter a city:"
		what_city = gets.chomp.downcase.tr(" ", "_")
	get_weather(what_city)
	puts "\n Try another city? y or n"
		find_weather = gets.chomp
end