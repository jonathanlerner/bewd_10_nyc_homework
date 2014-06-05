# User class (an individual user of the service)
class User
	attr_accessor :firstname, :lastname, :username, :email
	def initialize(firstname,lastname,username,email)
		newuser = {'first'=>firstname,'last'=>lastname,'username'=>username,'email'=>email}
		@firstname = firstname
		@lastname = lastname
		@username = username
		@email = email
	end

end