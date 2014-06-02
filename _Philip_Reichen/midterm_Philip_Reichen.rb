require 'rubygems'
require 'oauth'
require 'json'
require 'rest-client'


# Parse a response from the API and return a user object.
def parse_user_response(response)
  user = nil

  # Check for a successful request
  if response.code == '200'
    body = response.body
    user = JSON.parse(body)
    puts "Hello, #{user["screen_name"]}!"
    puts "Let me guess... Your name is #{user["name"]}"
    puts "Let me guess again... You like to describe yourself as #{user["description"]}"
  else
    # There was an error issuing the request which means that the user has entered his credentials incorrectly.
    puts "Expected a response of 200 but got #{response.code} instead. Make sure your credentials are correct and try again."
  end

  user
end

# All requests will be sent to the Twitter server.
baseurl = "https://api.twitter.com"

# Verify credentials returns the current user in the body of the response.
address = URI("#{baseurl}/1.1/account/verify_credentials.json")

# Set up HTTP.
http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

# Twitter API credentials

consumer_key = OAuth::Consumer.new(
	"p0KH7insfz8VxfusgBbV7uHoD",
    "GaCtE2s0VOAhvkmC5cvOM3wDUtDPGgSIjMMpgZSozMm0p0QImJ")
access_token = OAuth::Token.new(
	"29647988-cpzE51Rom8FSUA7TJU3ihp1Ai8xaI8ETOk84JYnrR",
 	"oRZe0rhFrd0WMMhEYVYgKvI3FWujdcfKZC0bf39gBfpi6")

# Issue the request.
request = Net::HTTP::Get.new address.request_uri
request.oauth! http, consumer_key, access_token
http.start
response = http.request(request)
user = parse_user_response(response)

#To see all the fields of the user object uncomment the following line
#puts user