require_relative 'get_info'
require_relative 'get_theaters'

results=[]

go = CollectInfo.new()

#data = zip or city depending on choice
data = go.start 

#sends data to the API call in this class
api = GetTheaters.new(data)
api.get_stuff