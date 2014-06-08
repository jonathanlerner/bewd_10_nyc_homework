require 'rubygems'
require 'twilio-ruby'
require 'pry'

require_relative 'lib/friend'
require_relative 'lib/host'
# require_relative 'lib/text'

accountsid = "ACdfb6c55c5991b177666a8870e4b536db"
authtoken = "35c4514dde77594b098455fb70441c19"

client = Twilio::REST::Client.new(accountsid, authtoken)
 
from = "2039161681" # Your Twilio number
 
puts "------Welcome to your quick party planner!------ "
puts "Add your friends to the party, give them roles and text everyone the details! Let's get started!"
puts "You're the awesome host! so how bout you tell us your name"
host = gets.strip.capitalize!
h = Host.new(host)
puts "Let's add some of your friends to your party #{host}!"
puts "Would you like to add a friend?"
if gets.strip.downcase == "yes"
	h.addfriend
end

puts "#{h.friends_list}"
puts "We got it from here, we're sending everyone a text reminder now!"

h.friends_list.each do |friend|
	# puts friend.name
	# puts friend.number
	# puts friend.role
	client.account.messages.create(
   :from => from,
   :to => friend.number,
   :body => "Sup #{friend.name}! I'm having a party this Friday at 10PM! You're responsible for the #{friend.role} See you then!"
 ) 
	puts "Sent text message to #{friend.name}"
end