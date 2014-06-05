class SecretNumber  
# this class will generate our secret number for us
attr_accessor :secret_number

def initialize

	range = (1..10).to_a

    @secret_number = range.sample(1)


end

end
