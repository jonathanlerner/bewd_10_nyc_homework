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
    @first_name = "Susan"
    @last_name = "Lynch"
    @secret_number = 10
    @guesses = 0
    @guesses_left = 0
  end

  def play
    greeting
    @guesses_left = @guesses + 1
    @guesses.times do |x|
      @guesses_left = @guesses_left - 1 
      puts "\nYou have #{@guesses_left} guess#{@guesses_left > 1? 'es' : ''} left!"
      puts "Please make your #{@guesses_left == @guesses? 'first' : 'next'} guess:" #Prompt the player for his/her guess.
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end

  def ask_difficulty
    puts "Which version of the game do you want to play? Please enter a number between 1 and 3. (1=easy, 2=medium and 3=hard)"
    level = $stdin.gets.chomp
    level = level =~ /[1-3]/ ? level : '2' # If the player enters an invalid number, default to 2=medium.
    set_difficulty(level)                  # Set number of guesses based on the selected difficuly.
  end

  def set_difficulty(level)
    case level # limit the number of guesses based on the difficulty
    when '1'                               # Easy
      @guesses = 4
    when '2'                               # Medium
      @guesses = 3
    when '3'                               # Hard
      @guesses = 2
    end
  end
    
  def greet(player_name)
    return "Hello, #{player_name}! Let's play Secret Number." #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
  end

  def created_by
    return "Created by #{@first_name} #{@last_name}." #Created_by is a string that includes your first and last name
  end


  def correct?(players_guess)
    if players_guess == @secret_number
      puts "You win! The number was #{@secret_number}."
      return true
    elsif players_guess < @secret_number 
      if @guesses_left > 1                  # Suppress message if the game is over
        puts "Make your next guess higher than #{players_guess}"
      end
    elsif players_guess > @secret_number
      if @guesses_left > 1                  # Supress message if the game is over
        puts "Make your next guess lower than #{players_guess}"
      end
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
