require "json"
require "rest-client"

class Midterm

  def determine_event_desired(event)
  	desired_event = event["type"].include "pancakes"
    puts "What type of event do you want to attend?"
  	user_input = $stdin.gets.chomp
  	if user_input.include "pancakes"
  		puts "You might like to attend the event called: #{@desired_event}"
  	end
  end

  def get_convio_api(event)
    res = JSON.load(RestClient.get('https://www.michaeljfox.org/convio_gem_events.json'))
    res["events"].each do |event|
      events = {
        title: event['title'], 
        type: event['gem_event_type'], 
      }
  	end
    
  end
end

Midterm.determine_event_desired
