class CollectInfo

	def start #makes everything work
		get_name
		puts "Hello #{@name}, you are searching for Movie theaters"
		get_search
		return @search_data
	end

	def get_name  #find the users name
		puts "Welcome, whats your name?"
		@name = gets.chomp
	end

	def get_search #gets their search preference and calls appropriate method
		puts "Would you like to search by?"
		puts "enter 1 for zipcode"
		puts "enter 2 for city"
		@response = gets.chomp

		if @response == '1'
			@search_data = ask_zip
		elsif @response == '2'
			@search_data = ask_city
		else
			puts "Please enter a valid option"
		 	get_search
		end
	end

	def ask_zip #gets and checks for a valid zip
		puts "Please enter a zipcode"
		@zip = gets.chomp

		if @zip.length == 5 && /^(?<num>\d+)$/ =~ @zip
			puts "ok"
		else
			puts "not a vaid zipcode"
			ask_zip
		end
		return @zip
	end

	def ask_city #gets a city
		puts "Please enter a city"
		@city = gets.chomp
		return @city
	end


end