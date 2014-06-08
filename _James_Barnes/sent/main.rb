require 'geocoder'
require 'rubygems'
require 'json'
require 'oauth'
require 'dotenv'
Dotenv.load
require_relative 'lib/location'
require_relative 'lib/tweets'
require_relative 'lib/score'
require_relative 'lib/sents'


sents=Sents.new #

location = Location.new
location.get_address
location.confirm_location
tweets = Tweets.new
tweets.get_tweets(location)

score = Score.new
score.score_tweets(tweets.parsed_tweets, sents)
score.score_message
