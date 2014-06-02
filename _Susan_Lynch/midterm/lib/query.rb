#
# Help the user define a new DPLA API query
#
class Query
@@format =['image','text','sound']   # The items in the response can be filtered by format.

def initialize(dpla)
puts "Please enter a keyword for searching"
@keyword = gets.chomp.downcase
response = ""
while response !~ /[yn]/ 
	puts "Would you like to filter the results by format e.g. image, sound...? Enter y=yes or n=no."
	response = gets.chomp.downcase
end
if response == 'y'
    puts "You have the following options:"
    0.upto(@@format.size-1) do |i|
    	puts @@format[i]
    end
    puts "Please enter your choice"
    @format = gets.chomp.downcase
    if @@format.include?(@format)   # The specified format is valid.
    	@format="&sourceResource.type="+@format
	else                            # The specified format is invalid.
		puts "Invalid format specified. The value is ignored."
		@format = ''
	end
else
	@format = ''
end
# Construct the API query
@query = dpla.api_url + '?q=' + @keyword + @format + "&api_key="+ dpla.api_key
end

def run_query
	
	doc = RestClient.get(@query)    # Run the query. JSON is returned.
	formatdoc = JSON.load(doc)      # Convert the response from JSON to a Ruby data structure
	count = formatdoc['limit']      # How many item entries were returned?
	0.upto(count-1) do |i|          # Print the title, URL and format for each item
		if formatdoc['docs'][i]['sourceResource']['title'].kind_of?(Array)
			title = formatdoc['docs'][i]['sourceResource']['title'][0]
		else
			title = formatdoc['docs'][i]['sourceResource']['title']
		end
		puts "Title= " + title
		puts "URL= " + formatdoc['docs'][i]['isShownAt']
		puts "Type= " + formatdoc['docs'][i]['sourceResource']['type']
		puts "------------------"
	end
end
end