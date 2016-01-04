# ex3_medium_question5.rb

def factors(number)
  dividend = number
  divisors = []
#  begin
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
#  end until dividend == 0
  divisors
end

## Bonus 1: What is the purpose of the number % dividend == 0 ?
## factors don't have a remainder, this checks that the divisors 
## divide evenly into the number.

## Bonus 2:
## What is the purpose of the second-to-last line in the method 
## (the divisors before the method's end)?
# To make the method return "devisors"
