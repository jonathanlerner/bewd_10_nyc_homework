require_relative 'mashable.rb'

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  	def self.check_input(name)
		if name == "rachel"
			puts Mashable.search_story_title
		else 
			puts "Please enter rachel for your name"
			name = gets.chomp
		end
	end
end