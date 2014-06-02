require 'json'
require 'rest-client'
require 'pry'

require_relative 'lib/get_stories'

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
  Titles.new(attributes)
  @finalStories = []
  @attributes.each do |story|
    if story.downcase.include?(search_term.downcase)
      @finalStories << story
    end
  end

  return @finalStories
end

puts "Put in a search query"
search_term = get_search.downcase
puts "How many results would you like to display?"
num_results = get_count
search_results = search_stories(search_term)

if search_results.empty?
  puts "No matches for this query"
end

search_results_count = search_results.count

if search_results_count > num_results.to_i
  results_count = num_results
  elsif search_results_count <= num_results.to_i
  results_count = search_results_count
end


1.upto(results_count) do |num|
  puts search_results[num]
end

