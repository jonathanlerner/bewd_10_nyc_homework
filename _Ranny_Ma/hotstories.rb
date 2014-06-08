require 'json'
require 'rest-client'
# require 'welcomemodule'

class MashableHot
   def initialize #(title, story_number)
    # @title = title
    # @story_number = story_number
    @stories = []
    @res = {}
  end

  def show_hot_title
    @res = JSON.load(RestClient.get('http://mashable.com/stories.json'))
    # binding.pry
    @stories = @res['hot'].map {|x| x["title"]}
    @stories.each_with_index {|title, index| puts "#{index}. #{title}"}
    puts "Which story would you like to read? [0-9]"
    choose_hot_story
  end

  def choose_hot_story
    story_number = gets.chomp.to_i
    until (0..9).include?(story_number)
        puts "Sorry, please enter a valid story number: [0-9]"
        story_number = gets.chomp.to_i
    end
        show_hot_stories(story_number)
  end

  def show_hot_stories(story_number)
    puts @res['hot'][story_number]['content'].values
    puts "\nWant to read another story?"
    welcome
  end

  def welcome
    puts "Press H for hot stories or N for new stories, or Q to quit."
    input = gets.chomp.upcase

    until (input == "N" or input == "H" or input == "Q")
      puts "Sorry, please enter a valid command: N, H, or Q."
      input = gets.chomp.upcase
    end

    case input
    when "N"; show_new_title
    when "H"; show_hot_title
    when "Q"; puts "Thanks for reading!"
    end
  end
end
