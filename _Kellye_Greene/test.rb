require 'rubygems'
require 'oauth'
require 'json'

# Now you will fetch /1.1/statuses/user_timeline.json,
# returns a list of public Tweets from the specified
# account.


baseurl = "https://api.twitter.com"
path    = "/1.1/search/tweets.json"
query   = URI.encode_www_form(
    "q" => "Obama"
    )
address = URI("#{baseurl}#{path}?#{query}")
request = Net::HTTP::Get.new address.request_uri

# Print data about a list of Tweets
def print_timeline(tweets)
  tweets.each do |tweet|
  require 'date'
    d = DateTime.parse(tweet['created_at'])
    puts " #{tweet['text'].delete ","} , #{d.strftime('%d.%m.%y')} , #{tweet['user']['name']}, #{tweet['id']}"
  end
end

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# If you entered your credentials in the first
# exercise, no need to enter them again here. The
# ||= operator will only assign these values if
# they are not already set.
consumer_key = OAuth::Consumer.new(
    "")
access_token = OAuth::Token.new(
    "")

# Issue the request.
request.oauth! http, consumer_key, access_token
http.start
response = http.request request

# Parse and print the Tweet if the response code was 200
tweets = nil
puts "Text,Date,Name,id"
if response.code == '200' then
  tweets = JSON.parse(response.body)
  print_timeline(tweets)
end
nil
