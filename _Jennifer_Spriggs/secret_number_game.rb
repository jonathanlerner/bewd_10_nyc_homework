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
    @first_name = "Jennifer"
    @last_name = "Spriggs"
    @secret_number = 5
    @guesses = 3
  end

  def play
    greeting
    guesses_left = @guesses 
    @guesses.times do |x|
      puts "\nYou have #{guesses_left} guesses left!"
      guesses_left -= 1
      puts "Please make your first guess:"
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end
    
  def greet(player_name)
    puts "Welcome #{player_name}, to the Secret Number Game! I'm thinking of a number from 1-10. You have #{@guesses} guesses to get it right!" 
  end

  def created_by
    puts "Created by Jennifer Spriggs." 
  end


  def correct?(players_guess)
    #puts players_guess
    if players_guess == 5
      puts "You win! The number was #{@secret_number}."
      return true
    elsif players_guess < 5
      puts "Make your next guess higher than #{players_guess}"
    elsif players_guess > 5
      puts "Make your next guess lower than #{players_guess}"
    end
    false
  end

  private 

  def greeting
    puts created_by
    puts "\nWhat is your name?"
    player_name = $stdin.gets.chomp
    puts greet(player_name)
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end
