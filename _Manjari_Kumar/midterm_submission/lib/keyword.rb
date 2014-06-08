class Keyword

  attr_accessor :keyword_string, :split_into_array
  
  def initialize(keyword_string)
    @keyword_string = keyword_string
  end

  def split_into_array
  	  @keyword_array = keyword_string.split(%r{,\s*})
  end 
end