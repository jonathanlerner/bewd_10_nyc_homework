
require 'rest-client'
require 'json'

class Beer

attr_accessor  :beername, :stylename, :organic, :desc, :avail, :category, :abv

def getbeer
newbeer = JSON.load(RestClient.get('http://api.brewerydb.com/v2/beer/random?key=86218246293bbfe86b588c02dbad2206'))

newbeer["data"].default = "No Data for Key"


 if nil ^ stylename == false then 
 	stylename = "No Style Listed" end

 if nil ^ category == false then 
 	category = "No Category Listed" end

 if nil ^ desc == false then 
 	desc = "No Description" end

 if nil ^ avail == false then 
 	avail = "No availability info" end
 
 if nil ^ organic == false then
  	organic = "No info on organic" end
 
 if nil ^ abv == false then
  	abv = "No info on abv" end

 if nil ^ beername == false then
  	beername = "No beer name" end

  @beername = newbeer["data"]["name"]
  @stylename = newbeer["data"]["style"]["name"]
  @organic = newbeer["data"]["isOrganic"]
  @abv = newbeer["data"]["abv"]
  @desc =    newbeer["data"]["description"]
  @avail =   newbeer["data"]["available"]["description"]
  @category = newbeer["data"]["style"]["category"]["name"]


 
 

end #getbeer



def getbeerlist(bnum)
@bnum = bnum
@total = 0 
beerlist = Hash.new

while @bnum > @total do 
if @bnum > 4 then puts "Too many beers" 
else randbeer = JSON.load(RestClient.get('http://api.brewerydb.com/v2/beer/random?key=86218246293bbfe86b588c02dbad2206'))
end

 @beerid = randbeer["data"]["id"].to_s
#puts @beerid
 newbeer = JSON.load(RestClient.get('http://api.brewerydb.com/v2/beer/' + @beerid +'?key=86218246293bbfe86b588c02dbad2206'))
 
 beername = newbeer["data"]["name"]
 stylename = newbeer["data"]["style"]["name"]
 abv = newbeer["data"]["abv"]

 if nil ^ stylename == false then 
 	stylename = "No Style Listed" end
 if nil ^ abv == false then 
 	stylename = "No Style Listed" end
  if nil ^ beername == false then 
 	beername = "No Name ???" end

 beerlist.store( :NAME , beername)
 beerlist.store( :STYLE , stylename)
 beerlist.store( :ABV , abv)   
  
 puts beerlist.to_a.join(" ---> ")

 @total = @total + 1
end
#puts beerlist.keys
#puts beerlist.values

end #getbeerlist


def showbeer
  puts " Beer Name ***** #{@beername}" 
  puts "  Style ***** #{@stylename}" 
  puts "   Category ***** #{@category} "
  puts "    Organic ***** #{@organic}"   
  puts "     ABV ****** #{@abv}"
  puts "     Availability ***** #{@avail} "
  puts "  Notes: *********************************************" 
  puts "    #{@desc}"
   end


end #class

