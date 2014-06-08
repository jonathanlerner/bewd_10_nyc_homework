class Story

  attr_accessor :title, :content, :facebook_shares, :twitter_shares, :google_plus_shares, :linked_in_shares, :total_shares
  
  def initialize(title, content, facebook_shares, twitter_shares, google_plus_shares, linked_in_shares, total_shares)
    @title = title 
    @content = content
    @facebook_shares = facebook_shares
    @twitter_shares = twitter_shares
    @google_plus_shares = google_plus_shares
    @linked_in_shares = linked_in_shares
    @total_shares = total_shares
  end

end