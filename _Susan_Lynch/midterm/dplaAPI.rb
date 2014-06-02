#
# This service helps a user query DPLA- the Digital Public Library of America.
# The architecture will allow future inclusion of other information sources.
# Also planned but not implemented is the persistance of user queries
#
# Include all needed helper code.
#
require "json"
require "rest-client"
require_relative 'lib/info_source'
require_relative 'lib/all_users'
require_relative 'lib/user'
require_relative 'lib/query'
#
# Create a new information source
#
dpla = InfoSource.new('DPLA','http://dp.la','Digital Public Library of American','8583952414d669c4b46448c8bcbbdc97','http://api.dp.la/v2/items')
#
# Tell the user about the information source
#
puts "This service is designed to help you search the following information sources:"
dpla.describe
users_list = AllUsers.new
active_user = users_list.new_user
puts "\nHello " + active_user.firstname + '. Thank you for your interest in DPLA!'

puts "Would you like to build and run a query? Enter y=yes or q=quit"
response = gets.chomp.downcase
while response == 'y' 
  active_query = Query.new(dpla)     # Help the user define a query
  active_query.run_query        # Run the user's query and display select fields
  puts "Would you like to build and run another query? Enter y=yes or q=quit"
  response = gets.chomp.downcase
end

