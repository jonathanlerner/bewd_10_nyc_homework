
require 'json'
require 'rest-client'

def show_message(message)
  puts message
end

def get_search
  gets.strip
end

def get_results
  gets.strip
end

def search_stories(stories)
  #Complete this section with both map and each. Highlight the difference of each.
  stories.map do |story|
    "Story: #{story[:title]},\n\n Category: (#{story[:category]}),\n\n Current Upvotes: #{story[:upvotes]}"
  end
end

def loop_through_stories(get_mapped_stories)
  get_mapped_stories.each do |story|
    puts "Would you like to continue reading?"
    user_answer = gets.chomp

    if user_answer == "y" || user_answer == "yes"
      puts "Testing yes"
    end
    if user_answer == "n" || user_answer == "no"
      puts "Testing no"
    end
  end
end

def twitter
  res = JSON.load(RestClient.get('http://digg.com/api/news/popular.json'))
  res["data"]["feed"].map do |story|
    attributes = {title: story["content"]["title"], category: story["content"]["title"]}
    attributes
  end

end

puts "Search Twitter for content"
stories = twitter
get_mapped_stories = search_stories stories
puts loop_through_stories stories

