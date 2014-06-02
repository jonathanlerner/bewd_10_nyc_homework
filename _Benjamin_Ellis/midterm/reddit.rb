#!/usr/bin/ruby

require 'json'
require 'rest-client'

class Rsearch

	attr_accessor :topic, :totalUps, :children

	def initialize
		getInput
		@totalUps = 0
	end

	def getInput
		puts "Enter a topic:  "
		@topic = gets.chomp
		topicExist(@topic)
	end


	def getResults
		results = JSON.load(RestClient.get("https://www.reddit.com/r/"+topic+".json"))
		
		results['data']['children'].map do |story|
			@totalUps+=story['data']['ups']
		end
		puts "#{@topic} has #{@totalUps} upvotes."
	end

	def topicExist(topic)
		begin
			check = JSON.load(RestClient.get("https://www.reddit.com/r/"+topic+".json"))
			puts check['children']
		rescue
			puts "Not a thing.  Try that again:"
			getInput
		end
	end

end
