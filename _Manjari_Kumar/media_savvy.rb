# ![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")

# Back-End Web Development
# --------

# ##MIDTERM  REQUIREMENTS

# Create a command line based application that fulfills these criteria:

# -  Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
# -   Connects to a 3rd party api where the call varies based on what the user gives you.
# -   Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
# -   Push code on Github.


# ##GRADING
# Your midterm is considered completed if it meets all requirements above. Your instructor and T.A will provide you with feedback.


# API Ideas:

# *   omdapi.com
# *   Twitter search api
# **********************************************************************************************************************************



require 'json'
require 'rest-client' 

def show_message(message)
  puts message
end

def ask_category
  print "\nWhat category of articles are you interested in ? \n Please select one of the options below:\n"
  print "1. Sports \n2. Politics \n 3. Celebrity \n 4. Food \n 5. Business\n"
  
  user_choice = gets.chomp!

  case user_choice.downcase  
    when "sports", "1"
      category = "sports"
      keywords = "game, tennis, NBA, basketball, US Open, baseball, golf, PGA"
    when "politics", "2"
      category = "politics"
      keywords = "president, prime minister, war, election, state, economy, NSA"
    when "celebrity", "3" 
      category = "celebrity"
      keywords = "Beyonce, justin bieber, oprah, Matt Damon, Jay Carney"
    when "food", "4" 
      category = "food"
      keywords = "sandwich, tacos, pizza, food, organic, vegan"
    when "business", "5" 
      category = "business"
      keywords = "rental, market, CEO, stock, price, brand"
    else print "\nI do not understand that choice\n"
      ask_category  
  end
return keywords
end


def show_new_story_notification(story)
  "New story added! Title: #{story[:title]} \nCategory: #{story[:category].capitalize}, \nCurrent Upvotes: #{story[:upvotes]}\n"
end

def category_filter(stories, keywords)
  counter=0
  keyword_array = keywords.split(%r{,\s*})
  print keyword_array
  stories.each do |s|
    keyword_array.any? do |word|
      if s[:body_text].downcase.include? word.downcase
      counter+=1
      print "\n#{counter}. #{s[:title]} \nwas shared #{s[:facebook]} times on facebook\n"
      print "\nwas shared #{s[:twitter]} times on twitter\n"
      print "\nwas shared #{s[:google_plus]} times on google_plus\n"
      print "\nwas shared #{s[:linked_in]} times on linked_in\n"
      print "\nwas shared #{s[:total]} times in total\n" 
      end
    end
  end 
end


def show_all_stories(stories)
  #Complete this section with both map and each. Highlight the difference of each.
  stories.each do |story|
    print story
  end
end


  def get_from_mashable
  res = JSON.load(RestClient.get('http://mashable.com/stories.json'))
  all_stories = []
  res["new"].each do |story|
    s = {title: story["title"], body_text: story["content"]["plain"], facebook: story["shares"]["facebook"], twitter: story["shares"]["twitter"],
      google_plus: story["shares"]["google_plus"], linked_in: story["shares"]["linked_in"], total: story["shares"]["total"]}
    all_stories << s
    end
    return all_stories
  end


stories = get_from_mashable
puts "Welcome to Media Savvy! A media selecion adviser. It's all about location, location, location!"
keywords = ask_category
category_filter(stories, keywords)    
# show_all_stories stories
