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
    @first_name = 'Alex'
    @last_name = 'Buell'
    @secret_number = 3
    @guesses = 5
  end

  def play
    greeting
    
    @guesses.times do |x|
      guesses_left = @guesses-x #Find a way to decrement guesses_left each time through the loop.
      puts "\nYou have #{guesses_left} guesses left!"
      puts "Please make your first guess:"
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end

  def ask_difficulty
    # As the user if they want to play on easy (1), medium (2), or hard (3)
    puts "Which difficulty would you like to play at? ( easy (1), medium (2), or hard (3) )"
    @difficulty = gets.chomp
    diff = 0

    if @difficulty == '1' || @difficulty.downcase == 'easy'
      puts 'You chose easy! Enjoy the maximum guesses!'
      diff = 0
    elsif @difficulty == '2' || @difficulty.downcase == 'medium'
      puts 'You Chose medium, Enjoy 1 less guess!'
      diff = 1
    elsif @difficulty == '3' || @difficulty.downcase == 'hard'
      puts 'You chose hard!  Enjoy 2 less guesses'
      diff =2
    else
      puts "please enter a valid difficulty"
      ask_difficulty
    end 
      

    set_difficulty(diff)
  end

  def set_difficulty(level)
    @guesses = @guesses -level # limit the number of guesses based on the difficulty
  end
    
  def greet(player_name)
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
    puts "Hello #{player_name}"
    puts "Guess the secret number (between 1 and 10)"
    if @guesses == 1
      puts "You get #{@guesses} guess"
    else
      puts "You get #{@guesses} guesses"
    end
  end

  def created_by
    #Created_by is a string that includes your first and last name
    puts "Created by: #{@first_name} #{@last_name}"
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
