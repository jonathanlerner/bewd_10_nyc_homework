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