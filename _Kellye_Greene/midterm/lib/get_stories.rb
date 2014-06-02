class Titles

  attr_accessor :attributes
  
  def get_titles(attributes)
    res = JSON.load(RestClient.get('http://digg.com/api/news/popular.json'))
    @attributes = []
    res["data"]["feed"].map do |story|
      @attributes << story["content"]["title"]
    end
  end


end

