
require 'rest-client'
require 'json'


class Style 


def liststyles

  response = JSON.load(RestClient.get('http://api.brewerydb.com/v2/styles?key=86218246293bbfe86b588c02dbad2206'))
  
  response["data"].each do |beer|
  @stylename = beer["name"]
  @styleid = beer["id"]
  puts "****  #{@stylename} ****** "
 end
end


def searchstylename(keyword)
@keyword = keyword
@results = 0

response = JSON.load(RestClient.get('http://api.brewerydb.com/v2/styles?key=86218246293bbfe86b588c02dbad2206'))

 response["data"].compact.map do |beer|
   stylename = beer["name"]
  
  if stylename.include? keyword then
  	puts "Style =  #{stylename} "  
  	puts "-------------------------------------------------"
    @results = @results + 1
  end
 end 
  puts "**** You searched for #{@keyword} and got #{@results} results "
end #searchstylename


def searchstyledesc(keyword)
 @keyword = keyword
 @results = 0

response = JSON.load(RestClient.get('http://api.brewerydb.com/v2/styles?key=86218246293bbfe86b588c02dbad2206'))

response["data"].map do |beer|
  styledesc = beer["description"]
   if nil ^ styledesc == false then puts "***********************"
    elsif styledesc.include? keyword then 
  		puts "Style Desc =  #{styledesc} "
  	puts "-------------------------------------------------"
    @results = @results + 1
    end
end
 puts "**** You searched for #{keyword} and got #{@results} results "
end #searchstyledesc


end #class