require_relative 'friend'

class Host
	attr_accessor :friends_list

	def initialize(name)
		@name = name
		@friends_list = []
	end
	def addfriend
		puts " -----Let's add your friend!-----"
		puts "What is you friend's name?"
		name = gets.strip.capitalize!
		puts "What do you want your #{name} to be in charge of?"
		role = gets.strip.capitalize!
		puts"what is your friends phone number(ex: 1231231234)"
		number = gets.strip.to_i
		f1 = Friend.new(name, role, number)
		@friends_list << f1
		addmore
	end
	def addmore
	puts "Would you like to add another friend? (yes/no)"
		if gets.strip.downcase.to_s == "yes"
			addfriend
		else 
			puts "Sounds like you're all set! Check out your VIP list"
		end
	end
end