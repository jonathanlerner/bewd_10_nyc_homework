require 'json'
require 'rest-client'

def get_search
  gets.chomp
end

def num_results
  gets.chomp
end

def get_titles
  res = JSON.load(RestClient.get('http://digg.com/api/news/popular.json'))
  @attributes = []
  res["data"]["feed"].map do |story|
    @attributes << {title: story["content"]["title"]}
  end
end

def search_stories
  @attributes.select do |attr|
    results = attr[:title].include?(@user_input)
    count = results.count
    puts "Found #{count} search results"
    results
  end
  if @attributes == nil
    puts "There were no matches"
  end
end

puts "Put in a search query"
get_search
@user_input = get_search
search_stories
