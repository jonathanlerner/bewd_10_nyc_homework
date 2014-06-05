require 'person'
require 'secret_number'

class Game
# this class will be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is structured properly


def play

puts " *****  The game will now begin ************ "

foo = SecretNumber.new

@guesses = 3 

puts " You have #{@guesses} guesses total"

1.upto(3) do |x|

  puts "Make your guess"

 @guess = gets.chomp!.to_i

 #puts @guess
 
 
 
 ##puts foo.secret_number[0]

if @guess != foo.secret_number[0]
 	puts "Sorry that's wrong -- please try again -- HINT: the number is #{foo.secret_number}"  
    
    @guesses = @guesses - 1
    puts " You have #{@guesses} guesses left"

else 
 	puts "You won -- Awesome guessing!!!" 
 	break 
 	
end

end

end

end

