#!/usr/bin/ruby

require './reddit.rb'

topic1 = Rsearch.new()

topic1.getResults

topic2 = Rsearch.new()

topic2.getResults

if topic1.totalUps > topic2.totalUps
	puts topic1.topic + " is cooler"
elsif topic1.totalUps < topic2.totalUps
	puts topic2.topic + " is cooler"
else
	puts "Topics are equally cool."
end