require 'geocoder'
require 'rubygems'
require 'json'
require 'oauth'
require_relative 'lib/location'
require_relative 'lib/tweets'
# require_relative 'lib/score'

sents = Hash[File.read('lib/AFINN-111.txt').split(" ").each_slice(2).to_a]

location = Location.new
location.get_address
location.confirm_location
tweets = Tweets.new
tweets.get_tweets(location)

puts tweets.parsed_tweets

def score_tweets(tweets, sents)
  score = 0
  tweets.map do |tweet|
    tokenized_tweet = tweet.split
      tokenized_tweet.map do |s|
        puts
        if sents[s.downcase] != nil
          score = score + sents[s.downcase].to_i
          puts s + " " + sents[s.downcase].to_s + " " + score.to_s
        end
      end
    end
    puts score
  end


score_tweets(tweets.parsed_tweets, sents)


