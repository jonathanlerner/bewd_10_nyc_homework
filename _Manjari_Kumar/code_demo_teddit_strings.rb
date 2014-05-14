#TEDDIT:  Strings - Student's File
#	Teddit is a Ruby text based news aggregator. Think Reddit in your terminal.
#	This exercise will be used throughout the ruby portion of this course. 
#	Each lesson we will incrementally build a news aggregator. 
#	Lesson 4 we will create a more dynamic Teddit, and pull the latest news stories from Mashable, Digg and Reddit. 
#	But until then we will hard code stories.


#This code along demonstrates how to work with strings. 
#Each version below, adds complexity to Teddit. Only run one version at a time so you can see the difference.


puts "Version 1 - Welcome the user to Teddit, print the first story to the terminal."

puts "Welcome to Teddit! a text based news aggregator. Get today\'s news tomorrow!"
puts "Story: Man raised by wolverines, then eaten Current upvotes:"

###########
###########

puts "Version 2 - Replace the story title and upvotes with variables."

puts "Welcome to Teddit! a text based news aggregator. Get today\'s news tomorrow!"
puts "Please enter a title for your story"
title=gets.capitalize!
print title
puts ": Man raised by wolverines, then eaten"
puts "Please enter Yay if you like the story and Nay if you don't"
total_votes=0
if gets.chomp!.capitalize.match("Yay")
  total_votes=total_votes+1
end
print "Current upvotes: "
puts total_votes


###########
###########



puts "Version 3 - Add data type casting (fix casting issue)."
puts "Welcome to Teddit! a text based news aggregator. Get today\'s news tomorrow!"
puts "Please enter a tile for your story"
title=gets.capitalize!
print title
puts ": Man raised by wolverines, then eaten"
puts "Please enter 1 if you like the story and 0 if you don't"
user_vote=gets.chomp!.to_i
total_votes=total_votes+user_vote
print "title"
puts ": Man raised by wolverines, then eaten"
print "Current upvotes:"
puts total_votes


###########
###########



puts "Version 4 - Use string interpolation and escape characters, polish the output."
puts "Please enter a tile for your story"
title=gets.capitalize!
print "#{title}: Man raised by wolverines, then eaten \n"
puts "Please enter 1 if you like the story and 0 if you don't"
user_vote=gets.chomp!.to_i
total_votes=total_votes+user_vote
print "Current upvotes: #{total_votes}\n"


puts "Version 5 - Adding a method with arguments"

def teddit(x)
x.capitalize!
print "#{x}: Man raised by wolverines, then eaten \n"
end

def vote_counter(y, z)
  if y.capitalize!.match("Yay")
    increment=1
    z=z+increment
    print "Current upvotes: #{z}\n"
  elsif y.match("Nay")
    increment=0
    z=z+increment
    print "Current upvotes: #{z}\n"
  else
  	puts "Please say yay or nay. You might want to check your spelling."
  	user_response_again=gets.chomp!
  	vote_counter(user_response_again, z)  #This recursive call is still a bit buggy. I'm flummoxed ! 
  end
end

puts "Please enter a title for your story"
title=gets.chomp!
teddit(title)

puts "Please enter yay if you like the story and nay if you don't"
user_response=gets.chomp!
vote_counter(user_response, total_votes)


###########
###########
