require 'rest-client'
require 'json' 
# require_relative 'news'

class Run
  def initialize(person)
    @person = person
    @mashable = "mashable"
    @digg = "digg"
  end

  def show_mash_stories(stories_mash)
     stories_mash.map do |story2|
      puts "THE LATEST NEWS ON MASHABLE:\n Story: #{story2[:title]}, Category: (#{story2[:channel]})"
    end
  end

  def show_digg_stories(stories_digg)
    #Complete this section with both map and each. Highlight the difference of each.
     stories_digg.map do |story3|
      puts "THE LATEST NEWS ON DIGG:\n Story: #{story3[:title]}, Category: (#{story3[:category]})"
    end
  end

  def get_from_mashable
    mash = JSON.load(RestClient.get('http://mashable.com/stories.json'))
    mash["new"].map do |story|
      attributes = {title: story["title"], author: story["author"], link: story["link"], channel: story["channel"]} 
      attributes
    end
  end

  def get_from_digg
    diggit = JSON.load(RestClient.get('http://digg.com/api/news/popular.json'))
    diggit["data"]["feed"].map do |story|
      attributes = {title: story["content"]["title"], category: story["content"]["tags"].first["display"]}
      attributes
    end 
  end   

  def play
    puts "Welcome #{@person.name.capitalize}! Please select either Mashable or Digg for the latest articles on each news site:"
      # 3.downto(1) do |guess|
        reader = gets.strip
        # get_input
           if reader.downcase == @mashable
            stories_mash = get_from_mashable
            puts show_mash_stories stories_mash
            # return true
          elsif reader.downcase == @digg
            stories_digg = get_from_digg
            puts show_digg_stories stories_digg
          elsif puts "Sorry #{@person.name.capitalize}, the #{reader.capitalize} news site is not part of our service at this time."
            exit
      # end
    end
    end
    

end