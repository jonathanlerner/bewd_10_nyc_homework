require_relative 'beer'
require_relative 'category'
require_relative 'style'


def instructmsg
spacer
puts "  ***  QUESTION  ***    

-- selection of options 5 and 6 sometimes crash with the following error which I have not been able to totally debug
   Any advice would be appreciated

   /Users/admin/dev/bewd_10_nyc_homework/_Chris_Brown/beer.rb:55:in `getbeerlist': undefined method `[]' for nil:NilClass (NoMethodError)
   from midterm_main.rb:89:in `choose'
   from midterm_main.rb:41:in `main'
   from midterm_main.rb:104:in `<main>'


This app calls the BreweryDB.com API. 
The limitations on the free (non-premium) key prevent
this app from calling the main beer API end-point. 
Hence this app has no direct Beer search capability"
spacer
end


def main
spacer
puts "Choose an action from the menu below"

spacer
puts " *********************************** "

puts "1 = List all styles"
puts "2 = Search style names using keyword "
puts "3 = Search style descriptions using keyword "
puts "4 = List all categories "
puts "5 = See info for a single random beer"
puts "6 = See info for a small list of beers"

select = gets.chomp!.to_i

if select == 0 then puts " **** Try again! **** "
	  main
   end
if select  < 1 then puts " **** Try again! **** "
	  main
   end
if select  > 6 then puts " **** Try again! **** "
	  main
  else choose(select)

  end 

 end #main

def choose(choice)
@choice = choice.to_i

mystyle = Style.new
mybeer = Beer.new
mycat = Category.new


if @choice == 1.to_i then 
	mystyle.liststyles
  end

if @choice == 2.to_i then 
   puts "Input a word to search on"
 word = gets.to_s.chomp!	
 mystyle.searchstylename(word)	
  end
 
if @choice == 3.to_i then 
	puts "Input a word to search on"
 word = gets.to_s.chomp!	
 mystyle.searchstyledesc(word)	
  end
 
if @choice == 4.to_i then 	
	mycat.listcats
  end
 
if @choice == 5.to_i then 
	mybeer.getbeer
	mybeer.showbeer
  end
 
if @choice == 6.to_i then 
	puts "Input a number of beers to return - 4 max"
 num = gets.chomp!.to_i	
	mybeer.getbeerlist(num)
  end

escape

end #choose

def escape
spacer  
   puts  "    Press Y to return to Menu 
              Press X to Quit       "
  
  continue = gets.chomp!.to_s.upcase

 if continue.eql? 'Y' then main 
 elsif continue.eql? 'X' then instructmsg
  else puts "  *** Try Again ***"
    escape
 end
end #escape

def spacer
1.upto(3) { |x|  puts "                    " } 
end

main










#mybeer.showbeer
#mybeer.getbeer
#mybeer.getbeerlist(3)
#mybeer.showbeer

#mystyle.liststyles
#mystyle.searchstylename('Brit')
#mystyle.searchstyledesc('Light')
#mybeer.listcats





