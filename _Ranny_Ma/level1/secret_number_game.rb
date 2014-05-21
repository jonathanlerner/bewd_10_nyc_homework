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
    @first_name = "Ranny"
    @last_name = "Ma"
    @secret_number = rand(1..10)
    @guesses = 5
  end

  def play
    greeting
    @guesses.times do |x|
      guesses_left = @guesses -=1
      puts "\nYou have #{guesses_left} guesses left!"
      puts "Please make your first guess:"
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end

  def greet(player_name)
    "Hi #{player_name}, please guess a number 1 to 10. You have #{@guesses} guesses"
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
  end

  def created_by
    "This game was created by #{@first_name} #{@last_name}"
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
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end
