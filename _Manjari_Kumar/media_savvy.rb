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

def get_input
  puts "What category of articles are you interested in ? \n Please select one of the options below:"
  
  gets.strip 
end

def show_new_story_notification(story)
  "New story added! Title: #{story[:title]} \nCategory: #{story[:category].capitalize}, \nCurrent Upvotes: #{story[:upvotes]}\n"
end

def calculate_upvotes(story)
  story[:upvotes] = 1

  if story[:title].downcase.include? 'horse'
    story[:upvotes] *= 5
  elsif story[:title].downcase.include? 'cheddar'
    story[:upvotes] *=8
  end

  if story[:category].downcase == "food"
    story[:upvotes] *= 3
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
  # puts "class of res is : #{res['new'][2]["shares"].keys}"

  res["new"].each do |story|
    s = {title: story["title"], story: story["content"]["plain"], facebook: story["shares"]["facebook"], twitter: story["shares"]["twitter"],
      google_plus: story["shares"]["google_plus"], linked_in: story["shares"]["linked_in"], total: story["shares"]["total"]}
    print "\n#{s[:title]} \nwas shared #{s[:facebook]} times on facebook\n"
    print "\nwas shared #{s[:twitter]} times on twitter\n"
    print "\nwas shared #{s[:google_plus]} times on google_plus\n"
    print "\nwas shared #{s[:linked_in]} times on linked_in\n"
    print "\nwas shared #{s[:total]} times in total\n"
    end
  end



puts "Welcome to Media Savvy! A media selecion adviser. It's all about location, location, location!"

stories = get_from_mashable
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
