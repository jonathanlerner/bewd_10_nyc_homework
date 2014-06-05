#Score class
class Score
  attr_accessor(:score)
  
  def initialize
    @score = 0
  end

  def score_tweets(tweets, sents)
    tweets.map do |tweet|
      tokenized_tweet = tweet.split
        tokenized_tweet.map do |s|
          if sents.sentiment[s.downcase] != nil
          @score = @score + sents.sentiment[s.downcase].to_i
        end
      end
    end
  end

  def score_message
    if @score > 50
      puts "Tweets in your area have a very positive sentiment: " + @score.to_s
    elsif @score > 0
      puts "Tweets in your area have a somewhat positive sentiment: " + @score.to_s
    elsif @score == 0
      puts "Tweets in your area have a neutral sentiment: " + @score.to_s
    elsif @score < -50
      puts "Tweets in your area have a very negative sentiment: " + @score.to_s
    else
      puts "Tweets in your area have a somewhat negative sentiment: " + @score.to_s
    end
  end

end