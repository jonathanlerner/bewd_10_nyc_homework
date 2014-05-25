# Print data about a list of Tweets
def print_timeline(tweets)
  tweets["statuses"].map do |tweet|
    puts tweet["text"]
  end
end

def get_tweets(lat,lon)
  # Change the following values to those provided on dev.twitter.com
  # The consumer key identifies the application making the request.
  # The access token identifies the user making the request.
  consumer_key = OAuth::Consumer.new("sDpKGBJZ13UEVVHbXfGdUZ4es","GRxfYWUCRI69hmJQBxG6yIDtJdzPqLTef1YQXVYEM1RqwJua1z")
  access_token = OAuth::Token.new("38451113-cjpCmIKxemXvaJBMtiMP3BVk4IeDoQg4YI9S5l7W2",
    "RIOA8quEcR9urZetIfWVGQAvZC9wJxGheNlCIkWwD3vUi")

  # Set up HTTP.
  http             = Net::HTTP.new address.host, address.port
  http.use_ssl     = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Issue the request.
  request.oauth! http, consumer_key, access_token
  http.start
  response = http.request request
  baseurl = "https://api.twitter.com"
  path = "/1.1/search/tweets.json"
  address = URI("#{baseurl}#{path}?#{query}")
  request = Net::HTTP::Get.new address.request_uri
  query = URI.encode_www_form("query" => "", "geocode" => "#{lat},#{lon},1mi","count" =>100)

  # Parse tweets if response code is 200
  tweets = nil
  if response.code == '200' then
    tweets = JSON.parse(response.body)
    print_timeline(tweets)
  end
end






