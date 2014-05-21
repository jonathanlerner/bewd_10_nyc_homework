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
    @first_name = "Joe"
    @last_name = "Leo"
    @secret_number = rand(10)+1
    @guesses = 0
  end

  def play
    greeting
    
    @guesses.times do |x|
      #Find a way to decrement guesses_left each time through the loop.
      puts "\nYou have #{@guesses} guesses left!"
      @guesses -= 1 
      puts "Please make your guess:"
      players_guess = $stdin.gets.chomp.to_i
      return if correct?(players_guess)
    end
    puts "You lost! :-( The number to guess was #{@secret_number}."
  end

  def ask_difficulty
    # As the user if they want to play on easy (1), medium (2), or hard (3)
    print "Choose your level of difficulty:\n 1. Easy \n 2. Medium \n 3. Hard \n"
    user_choice_string = $stdin.gets.chomp!
    user_choice_num = user_choice_string.to_i 
    if ((user_choice_num == 1) || (user_choice_num == 2) || (user_choice_num == 3))
      difficulty_level = user_choice_num
    elsif user_choice_string.capitalize == "Easy"
      difficulty_level = 1
    elsif user_choice_string.capitalize == "Medium"
      difficulty_level = 2
    elsif user_choice_string.capitalize == "Hard"
        difficulty_level = 3
    else ask_difficulty
    end
    set_difficulty(difficulty_level)                    
  end

  def set_difficulty(level)
    # limit the number of guesses based on the difficulty
    if level == 1
      @guesses=5
    elsif level == 2
      @guesses=3
    elsif level == 3
      @guesses=1
    end
  
  end
    
  def greet(player_name)
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
    player_name.capitalize!
    print "\nHi #{player_name} ! Secret Number is a guessing game. \nThe purpose of the game is to have players guess a secret number from 1-10. \nDepending on the level of difficulty you choose, you'll get 1, 3 or 5 guesses to find the secret number. \n" 
  end

  def created_by
    #Created_by is a string that includes your first and last name
    print "\nCreated by #{@first_name} #{@last_name} \n"
  end


  def correct?(players_guess)
    if players_guess == @secret_number
      puts "You win! The number was #{@secret_number}."
      return true
    elsif ((players_guess < @secret_number) && (@guesses > 0))
      puts "Make your next guess higher than #{players_guess}"
    elsif ((players_guess > @secret_number) && (@guesses > 0))
      puts "Make your next guess lower than #{players_guess}"
    end
    false
  end

  #Do not change anything past this line
  private 

  def greeting
    puts "\nSECRET NUMBER GAME\n"
    puts "~~~~~~~~~~~~~~~~~~\n"
    puts created_by
    puts "\nWhat is your name?"
    player_name = $stdin.gets.chomp
    puts greet(player_name)
    ask_difficulty
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end
