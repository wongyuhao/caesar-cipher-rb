require "pry"

loop do
p "Enter a number you want to fizzbuzz (n to exit)"

num = gets.chomp
break if num == "n"
num = num.to_i
opt = ""

if num%3 == 0 
  opt+="Fizz"
end

if num%5==0 
  opt+="Buzz"
end
#binding.pry
p opt




end