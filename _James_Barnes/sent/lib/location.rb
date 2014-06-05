#location class
class Location
  attr_accessor :city, :lat, :lon
  def welcome_message
    puts "Welcome to Location Sentiment checker. It evaluates the last 100 tweets in a given area for positive or negative sentiment."
  end

  #Asks user for location, and attempts to resolve input using geocoder.
  def get_address
    welcome_message
    puts "What is your location?"
    user_location = Geocoder.search(gets.chomp)[0]
    if user_location != nil
      adr = user_location
      @city = adr.city
      @lat = adr.latitude
      @lon = adr.longitude
    else
      no_match
    end
  end

  def no_match
    puts "We couldn't find you based on your input.\nTry again? (y) or (n)"
    user_choice = gets.chomp.to_s.downcase
    if user_choice == "y"
      get_address
    else
      abort("Maybe another time.")
    end
  end

  def confirm_location
    puts "It looks like you're in #{@city}, at latitude #{@lat} and longitude #{@lon}."
  end
end
