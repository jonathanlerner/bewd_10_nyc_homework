# All_users implements a repository or all users who have used the service in the past
 
class AllUsers

  def initialize
    @user_repository = []
  end

  def new_user
    puts "Please enter your first name"
    firstname = gets.chomp.capitalize
    puts "Please enter your last name"
    lastname = gets.chomp.capitalize
    email = ""
    while email !~ /^\S+@\w+\.\w+/    # Validate the email address provided by the user
    	puts "Please enter your email address"
    	email = gets.chomp
	end
	puts "Please enter a username"
	username = gets.chomp.downcase
	current_user = User.new(firstname,lastname, username, email)

    @user_repository << current_user
    return current_user
  end

end
