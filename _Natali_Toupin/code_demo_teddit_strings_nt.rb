#TEDDIT:  Strings - Student's File
#	Teddit is a Ruby text based news aggregator. Think Reddit in your terminal.
#	This exercise will be used throughout the ruby portion of this course. 
#	Each lesson we will incrementally build a news aggregator. 
#	Lesson 4 we will create a more dynamic Teddit, and pull the latest news stories from Mashable, Digg and Reddit. 
#	But until then we will hard code stories.


#This code along demonstrates how to work with strings. 
#Each version below, adds complexity to Teddit. Only run one version at a time so you can see the difference.


#Version 1 - Welcome the user to Teddit, print the first story to the terminal.
puts "Welcome to Teddit! A text based news aggregator/ Get today's news tomorrow!"
puts "Story: Man raised by wolverines, then eaten current upvotes: 4."

#Version 2 - Replace the story title and upvotes with variables.
begin
story = "wolverines"
upvotes_value = 4
	puts "Welcome to Teddit! a text based mews aggregator/ Get today's news tomorrow!"
	puts "Story: Man raised by #{story}, then eaten current upvotes: #{upvotes_value}."
end

#Version 3 - Add data type casting (fix casting issue).
puts = "Please enter topic:"
story = gets.chomp!
puts = "Please vote:"
upvotes_value = gets.chomp!.to_i

#Version 4 - Use string interpolation and escape characters, polish the output.
begin
story = "wolverines".capitalize
upvotes_value = 4.to_s
	puts "Welcome to Teddit! a text based mews aggregator/ Get today's news tomorrow!"
	puts "Story: Man raised by #{story}/a, then eaten current upvotes: #{upvotes_value}."
end


#Version 5 - Adding a method with arguments
def story(title, upvotes_value)
	puts "STory: Man raised by #{title}, then eaten current upvotes: #{upvotes_value}."
end
story(wolverines, 4)