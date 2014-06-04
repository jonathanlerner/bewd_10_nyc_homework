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
      keywords = "demonstration, president, prime minister, war, election, state, economy, NSA, political"
    when "celebrity", "3" 
      category = "celebrity"
      keywords = "Beyonce, justin bieber, oprah, Matt Damon, Jay Carney"
    when "food", "4" 
      category = "food"
      keywords = "sandwich, tacos, pizza, food, organic, vegan"
    when "business", "5" 
      category = "business"
      keywords = "rental, market, CEO, stock, price, brand, sales"
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
  facebook_total = 0
  twitter_total =0
  google_plus_total = 0
  linked_in_total = 0
  priority = []
  keyword_array = keywords.split(%r{,\s*})
  print keyword_array

  stories.each do |s|
    match_found = false
    keyword_array.any? do |word|
      if ((s[:body_text].downcase.include? word.downcase) && (match_found == false)) 
      counter+=1
      facebook_total += s[:facebook].to_i
      twitter_total += s[:twitter].to_i
      google_plus_total += s[:google_plus].to_i
      linked_in_total += s[:linked_in].to_i
      
      match_found = true
      print "\n#{counter}. #{s[:title]} \nwas shared #{s[:facebook]} times on facebook\n"
      print "\nwas shared #{s[:twitter]} times on twitter\n"
      print "\nwas shared #{s[:google_plus]} times on google_plus\n"
      print "\nwas shared #{s[:linked_in]} times on linked_in\n"
      print "\nwas shared #{s[:total]} times in total\n" 
      end
    end
  end 
  
  # priority = facebook_total, twitter_total, google_plus_total, linked_in_total
  # priority.sort

  print "\n\n**********************************************************************\n\n"
  print "\nTotal number of facebook shares for this category: #{facebook_total}\n"
  print "\nTotal number of twitter shares for this category: #{twitter_total}\n"
  print "\nTotal number of google_plus shares for this category: #{google_plus_total}\n"
  print "\nTotal number of linked_in shares for this category: #{linked_in_total}\n\n"
end


def show_all_stories(stories)
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
    print "#{s[:body_text]}"
    all_stories << s
    end
    return all_stories
  end


stories = get_from_mashable
print "\n\nWelcome to Media Savvy! A social media planner for ad placement. It's all about location, location, location!\n\n"
keywords = ask_category
category_filter(stories, keywords)    
# show_all_stories stories


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



# class Teddit

#   def get_story_from_mashable

#     res = JSON.load(RestClient.get('http://mashable.com/stories.json'))
#     res["new"].map do |story|
#     s = {title: story["new"].first["title"], story: story["new"].first["content"]["plain"]}
#     s.class
#     end
#   end 
# end


# begin
# def get_from_reddit
  # res = JSON.load(RestClient.get('http://www.reddit.com/.json'))
  # res["data"]["children"].map do |story|
    # s = {title: story["data"]["title"], category: story["data"]["subreddit"]}
    # calculate_upvotes s
    # show_new_story_notification s
    # s
  # end
#end

# begin
# def get_stories
# res = JSON.load(RestClient.get("http://www.digg.com/api/news/popular.json"))
  # res["data"]["feed"].map do {|story|}
  # end
# end
# end

  # def calculate_upvotes(story, category)
    # Write code so that:
      # If the Story is about cats multiply the upvotes by 5
      # If the Story is about bacon multiply the upvotes by 8
      # If the Story is about Food it gets 3 times the upvotes.
      # local_upvotes=1
      # if story.downcase.include?("cats")
        # local_upvotes=local_upvotes*5
      # elsif story.downcase.include?("bacon")
        # local_upvotes=local_upvotes*8
      # elsif story.downcase.include?("food")
        # local_upvotes=local_upvotes*3
      # end
       

    #For example:
    # "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
  # end


# teddit = Teddit.new
# teddit.get_story_from_mashable
