
(1..100).each{|num|
  if (num % 3 == 0) && (num%5 == 0)
    puts "Fizz"
  elsif (num % 3 == 0)
    puts "Fizz"
  elsif (num % 5 == 0)
    puts "Buzz"
  else
    puts num
  end
}

