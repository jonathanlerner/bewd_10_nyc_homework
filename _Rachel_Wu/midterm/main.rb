require_relative 'mashable.rb'
require_relative 'person.rb'







puts "Welcome to Mashable Tech! This app will show you all the popular technology news on Mashable! "
puts "What is your name?"
    
person = Person.new(@name)
@name = gets.chomp

Person.check_input(@name) 

mashable = Mashable.new(person).search_story_title

