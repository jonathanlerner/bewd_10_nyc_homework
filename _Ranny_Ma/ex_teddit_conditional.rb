# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below.
# Where you see comments (lines that begin with #) replace it with code so that the program works.

class Teddit

  def add_story
    puts "Please enter a News story:"
    story = get_input
    puts "Please give it a category:"
    category = get_input
<<<<<<< HEAD
    upvotes = calculate_upvotes(category)
=======
    upvotes = calculate_upvotes(story, category)
>>>>>>> saving minor changes
    puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"
  end

  def welcome
    puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
  end

  def get_input
    puts "enter input"
    input = gets.chomp
  end

  def calculate_upvotes(category)
    case category
      when "cats"
        upvotes*5
      when "bacon"
        upvotes*8
      when "food"
        upvotes*3
    end
  end

end

teddit = Teddit.new
teddit.add_story
