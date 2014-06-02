# Information source class
# Collect and save all pertinent information about an information source
#
class InfoSource

def initialize(name, url, desc, api_key, api_url)
    @name=name
    @desc = desc
    @url = url
    @api_key=api_key
    @api_url=api_url
   
end
attr_accessor :url, :api_key, :api_url

def describe
        puts "Name:  " + @name
        puts "URL:  " + @url
        puts "Description:  " + @desc
end

end