require 'geocoder'
require 'rubygems'
require 'json'
require 'oauth'
require_relative 'lib/location'
require_relative 'lib/tweets'






location = Location.new
location.get_address
location.confirm_location
tweets = Tweets.new
tweets.get_tweets(location)
puts tweets.parsed_tweets

