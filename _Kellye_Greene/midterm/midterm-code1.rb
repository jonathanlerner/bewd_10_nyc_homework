require 'json'
require 'rest-client'
require 'pry'

def get_search
  gets.chomp
end

def get_count
  gets.chomp.to_i
end

def get_titles
  res = JSON.load(RestClient.get('http://digg.com/api/news/popular.json'))
  @attributes = []
  res["data"]["feed"].map do |story|
    @attributes << story["content"]["title"]
  end
end

def search_stories(search_term)
  get_titles
  @attributes.select do |attr|
    attr.include?(search_term)
  end
end

puts "Put in a search query"
search_term = get_search
puts "How many results would you like to display?"
num_results = get_count
search_results = search_stories(search_term)

if search_results.empty?
  puts "No matches for this query"
end

num_results.times do |attr|
  search_results.each do |attr|
    puts attr
  end
end
