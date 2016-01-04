# ex3_medium_question3.rb

## The result of the following statement will be an error:

puts "the value of 40 + 2 is " + (40 + 2)

## Fix:
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s
