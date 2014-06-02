# Back-End Web Development
# --------

# MIDTERM  ASSIGNMENT - "Media Savvy"

# Media Savvy is an Object Oriented recommendation system that helps the user in selecting specific social media platform for ad placement.
# It connect to mashable.com API and fetches newly posted articles.
# It asks the user to select one of 5 categories such as Business, Politics, Celebrity etc. and prompts the user again if an invalid option is chosen. 
# It filters articles based on keywords associated with the selected category, and displays how often they were shared on various social media platforms.
# It gives a media wise total at the end, thus informing the user of the best platforms for placing their ads in a specific category. 
# It uses classes the classes Keyword, Story, and Recommendation

# **********************************************************************************************************************************



require 'pry'
require 'json'
require 'rest-client' 

require_relative 'lib/keyword'
require_relative 'lib/recommendation'
require_relative 'lib/story'


# Define our methods


def ask_category
  print "\n\nWhat category of articles are you interested in ? \n Please select one of the options below:\n"
  print " 1. Sports \n 2. Politics \n 3. Celebrity \n 4. Food \n 5. Business\n"

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
# Keyword.new(keywords)
end


def category_filter(stories, keywords)
  counter=0
  facebook_total = 0
  twitter_total =0
  google_plus_total = 0
  linked_in_total = 0
  # priority = []
  keyword_array = keywords.split(%r{,\s*})
  print "\nLooking for articles containing the following keywords: #{keyword_array}\n\n" 

  stories.each do |s|
    match_found = false
    keyword_array.any? do |word|
      if ((s.content.downcase.include? word.downcase) && (match_found == false)) 
      counter+=1
      facebook_total += s.facebook_shares.to_i
      twitter_total += s.twitter_shares.to_i
      google_plus_total += s.google_plus_shares.to_i
      linked_in_total += s.linked_in_shares.to_i
      
      match_found = true
      print "\n#{counter}. #{s.title} \nwas shared #{s.facebook_shares} times on facebook\n"
      print "was shared #{s.twitter_shares} times on twitter\n"
      print "was shared #{s.google_plus_shares} times on google_plus\n"
      print "was shared #{s.linked_in_shares} times on linked_in\n"
      print "was shared #{s.total_shares} times in total\n\n" 
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
    
    title = story["title"] 
    content = story["content"]["plain"] 
    facebook_shares = story["shares"]["facebook"]
    twitter_shares = story["shares"]["twitter"]
    google_plus_shares = story["shares"]["google_plus"]
    linked_in_shares = story["shares"]["linked_in"]
    total_shares = story["shares"]["total"]

    s = Story.new(title,content,facebook_shares,twitter_shares,google_plus_shares,linked_in_shares, total_shares)
    all_stories << s
    end
    return all_stories
  end


stories = get_from_mashable
print "\n\n\t\t\t***********************************************************************\n"
print "\n\n\t\t\t\t\t\tWelcome to Media Savvy\n\n"
print " \n\t\t\t\t\t\sA social media planner for ad placement. \n\t\t\t\t\tIt's all about location, location, location!\n"
print "\n\n\t\t\t***********************************************************************\n"

keywords = ask_category
category_filter(stories, keywords)    
# show_all_stories stories

