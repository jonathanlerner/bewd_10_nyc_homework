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
    @first_name = "Mike"
    @last_name = "Lewis"
    @secret_number = 10
    @guesses = 3    
    # @parting_gift = [ "3 day old Happy Meal!", "Mike's old pair of Chucks", "Microsoft Windows 98",  ]
    @parting_gift = [ "3 day old Happy Meal!", "Mike's old pair of Chucks", "unused Microsoft Windows 98", "factory sealed iPhone 3S!", "lifesize Chucky Doll!!"  ].sample
  end

  # guesses = 3
  # parting_gifts = [ "old sneakers", "happy meal", "cd player", "microsoft word 98 edition" ]

  def play
    greeting
    @guesses.times do |guesses|
      guesses -= 1 
      #Find a way to decrement guesses_left each time through the loop.
      guesses_left = 1 + @guesses -= 1 unless @value == 1
      puts "\n You have #{@guesses} guesses left!"
      puts "Make your next guess your best guess:"
      players_guess = $stdin.gets.chomp.to_i
      guesses -= 1
      return if correct?(players_guess)
    end
    puts "Close but no cigar."
    puts "The number to guess was #{@secret_number}."
    puts "Don't forget your fabulous parting gift: #{@parting_gift}!"

  end
    
  def greet(player_name)
    #Create a string to use as your greeting. It should include the player_name and the rules, with the number of guesses the player gets.
    puts "Hi #{player_name}." 
    puts "Welcome to Secret Number."
    puts "The purpose of the game is to have players guess a secret number from 1-10."
    puts "You get a total of #{@guesses} guesses to get the secret number."
  end

  def created_by
    #Created_by is a string that includes your first and last name
    puts "Created by Mike Lewis"
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
    puts "\n What is your name?"
    player_name = $stdin.gets.chomp
    puts greet(player_name)
  end

  def ___(*arguments)
    abort  "You have to fill in the blank on line #{caller.first.split(":")[1]}".center(100, "*")
  end
end