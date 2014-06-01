
require 'rest-client'
require 'json'


class Category


def listcats

  response = JSON.load(RestClient.get('http://api.brewerydb.com/v2/categories?key=86218246293bbfe86b588c02dbad2206'))

  response["data"].map do |beer|
  catname = beer["name"]
  catid = beer["id"]
  puts "*****   #{catname}   ***********"
  end  

end

end #class
