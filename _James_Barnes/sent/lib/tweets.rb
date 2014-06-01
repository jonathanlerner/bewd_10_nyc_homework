#Tweets class
class Tweets
  attr_accessor :response, :parsed_tweets

  #queries the Twitter search api using latitude and longitde, and stores 
  def get_tweets(location) 
    # Enter Oauth consumer key, consumer secret, access token and access token secret in .env
    consumer_key = OAuth::Consumer.new(ENV['consumer_key'],ENV['consumer_scret'])
    access_token = OAuth::Token.new(ENV['access_token'], ENV['access_token_secret'])

    baseurl = "https://api.twitter.com"
    path = "/1.1/search/tweets.json"
    query = URI.encode_www_form("query" => "", "geocode" => "#{location.lat},#{location.lon},1mi","count" =>100)
    address = URI("#{baseurl}#{path}?#{query}")
    request = Net::HTTP::Get.new address.request_uri

    # Set up HTTP.
    http             = Net::HTTP.new address.host, address.port
    http.use_ssl     = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    # Issue the request.
    request.oauth! http, consumer_key, access_token
    http.start
    @response = http.request request
    check_response
  end

  #parses tweets, and extracts the text of each tweet, storing it in an array
  def parse_tweets
    @response = JSON.parse(@response.body)
    @parsed_tweets = []
    @response["statuses"].map do |tweet|
      @parsed_tweets << tweet["text"]
    end
  end
  
  # Checks that the query got a reponse code 200
  def check_response
    if @response.code == '200' then
      parse_tweets
    else
      puts "There's an error. Response code: " + @response.code.to_s
    end
  end

end