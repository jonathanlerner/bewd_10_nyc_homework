###############################################################################
#
# Back-End Web Development - Homework #1
# This exercise will test your knowledge of Variables and Conditionals.
# Secret Number is a game. 
# The purpose of the game is to have players guess a secret number from 1-10.
#
# Wherever you see '___' in the code, that's where work needs to be done.
# Follow the instructions and replace '___' with working code.
#
# To play the game:
# `ruby play.rb` (on the commmand line)
#
# To run the specs (optional):
# `rspec secret_number_game_spec.rb`
#
###############################################################################

class SecretNumberGame
  
  def initialize
    @first_name = "Oleg"
    @last_name = "Moshkovich"
    @secret_number = 10
    @guesses = 5
  end

  def play
    counter = 0
    greeting
    @guesses.times do |x|
      guesses_left = @guesses - counter #Find a way to decrement guesses_left each time through the loop.
      puts "\nYou have #{guesses_left} guesses left!"
      puts "Please make your first guess:"
      players_guess = $stdin.gets.chomp.to_i
      counter +=1
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end
    
  def greet(player_name)
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
    "Hello, Dear #{player_name}, you have please guess a number, you have the total of #{@guesses}! Hope you win! "   
  end

  def created_by
    " This game is created by #{@first_name} #{@last_name} "
     #Created_by is a string that includes your first and last name
  end


  def correct?(players_guess)
    if players_guess == @secret_number
      puts "You win! The number was #{@secret_number}."
      return true
    elsif players_guess < @secret_number
      puts "Make your next guess higher than #{players_guess}"
    elsif players_guess > @secret_number
      puts "Make your next guess lower than #{players_guess}"
    end
    false
  end

  #Do not change anything past this line
  private 

  def greeting
    puts created_by
    puts "\nWhat is your name?"
    player_name = $stdin.gets.chomp
    puts greet(player_name)
    puts @guesses
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end
