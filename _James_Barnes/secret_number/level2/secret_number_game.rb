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
    @first_name = "James"
    @last_name = "Barnes"
    @secret_number = rand(1..10)
    @guesses = 5
  end

  def play
    greeting
    
    @guesses.times do |x|
      guesses_left = @guesses -=1 #Find a way to decrement guesses_left each time through the loop.
      puts "\nYou have #{guesses_left+1} guesses left!"
      puts "Please make your first guess:"
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end

  def ask_difficulty
    # Ask the user if they want to play on easy (1), medium (2), or hard (3)
    puts "Would you like to play  on 1. Easy, 2. Medium, or 3. Hard?"
    set_difficulty($stdin.gets.chomp.downcase)
  end

  def set_difficulty(level)
    # limit the number of guesses based on the difficulty
    level = level.downcase
    if (level == "medium" || level == "2")
      @guesses = 3
    elsif (level == "hard" || level == "3")
      @guesses = 1
    elsif (level != "easy" && level != "1")
      puts "You didn't enter a valid difficulty."
      ask_difficulty
    end
    return
  end
    
  def greet(player_name)
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
    return "Welcome #{player_name}. Let's play a game. You have #{@guesses} guesses to guess the secret number. Pick a number between 1 and 10. " 
  end

  def created_by
    return "Created by " + @first_name + " " + @last_name #Created_by is a string that includes your first and last name
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
    ask_difficulty
    puts "\nWhat is your name?"
    player_name = $stdin.gets.chomp
    puts greet(player_name)
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end
