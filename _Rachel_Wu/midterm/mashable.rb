require 'rest-client'
require 'json'

class Mashable

	def initialize(person)
		@person = person
		@stories = []
	end

	def get_from_mashable
  		mash = JSON.load(RestClient.get('http://mashable.com/stories.json'))
  		mash["hot"].map do |story|
    		item = {title: story["title"], author: story["author"], link: story["link"], content: story["content"]} 
    		@stories << item
    		@stories
  		end

	end

	def search_story_title
	  #search hot article's content to see if it has the word "technology" 
		@stories.each do |s|
		   content = s[:content]
		   	if content.downcase.include? "technology"
		   		
		    puts "Hi #{@person.name}!The Hotest Tech NEWS ON MASHABLE:\n Story: #{s[:title]}, Author: #{s[:author]}, URL: #{s[:link]}"
		  	else
		  	puts "Ooops! No Tech news now! "
		  	end
		end
  
	end
end