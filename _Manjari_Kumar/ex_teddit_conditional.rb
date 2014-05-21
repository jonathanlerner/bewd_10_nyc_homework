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
    upvotes = calculate_upvotes(story, category)
    puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"
  end

  def welcome
    puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
  end

  def get_input
    user_input=gets.chomp!
  end

  def calculate_upvotes(story, category)
    # Write code so that:
      # If the Story is about cats multiply the upvotes by 5
      # If the Story is about bacon multiply the upvotes by 8
      # If the Story is about Food it gets 3 times the upvotes.
      local_upvotes=1
      if category.downcase.match("cats")
        local_upvotes=local_upvotes*5
      elsif category.downcase.match("bacon")
        local_upvotes=local_upvotes*8
      elsif category.capitalize.match("Food")
        local_upvotes=local_upvotes*3
      end
        

    #For example:
    # "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
  end

end

teddit = Teddit.new
teddit.add_story
