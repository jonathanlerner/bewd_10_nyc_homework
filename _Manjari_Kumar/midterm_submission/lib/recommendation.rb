class Recommendation

  attr_accessor :stories, :keywords, :recommendation_list
  
  def initialize(stories, keywords)
    @stories = stories
    @keywords = keywords
  end

  def apply_category_filters
  end 

  def recommend_media
  end

end