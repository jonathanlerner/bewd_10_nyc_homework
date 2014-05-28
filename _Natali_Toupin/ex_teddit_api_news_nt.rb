# We're going to add a remote data source to pull in stories from Mashable and Digg.
  # http://mashable.com/stories.json
  # http://digg.com/api/news/popular.json
# These stories will also be upvoted based on our rules. No more user input!

# Pull the json, parse it and then make a new story hash out of each story(Title, Category, Upvotes)
# Add each story to an array and display your "Front page"

require 'rest-client'
require 'json'

def show_message(message)
	puts message
end

def get_input
	gets.strip
end

def show_new_story_notification(story)
	"New story added! #{story[:title]}, Category: #{story[:category].capitalize}, Current Upvotes: #{story[:upvotes]}"
end

def upvotes

def calculate_upvotes(story)

  if story[:title].downcase.include? 'Thialand'
    story[:upvotes] *= 5
  elsif story[:title].downcase.include? 'Beyonce'
    story[:upvotes] *=8
  end

  if story[:category].downcase == "Ukraine"
    story[:upvotes] *= 3
  end
end

def show_all_stories(stories)
 
  stories.map do |story|
    "Story: #{story[:title]}, Category: (#{story[:category]}), Current Upvotes: #{story[:upvotes]}"
  end
end

def get_from_mashable
	mash = JSON.load(RestClient.get("http://www.mashable.com/stories.json"))
	mash["new"].map do |story|
		title: story["new"]["title"], category: ["new"]["channel"], upvotes: ["hot"]["shares"]["total"]
		attributes = {title: story["new"], category: ["channel"], upvotes: ["hot"]} #note to self: for upvote use - uprising to shares and total
		calculate_upvotes(attributes)
		show_new_story_notification(attributes)
		attributes
	end
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
stories = get_from_mashable
puts show_all_stories stories

###def get_from_digg
	###digg = JSON.load(RestClient.get("http://digg.com/api.news/popular.json"))



