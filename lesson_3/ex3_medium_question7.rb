# ex3_medium_question7.rb

## Fibonacci calculator, A user passes in two numbers, 
## and the calculator will keep computing the sequence until some limit is reached.
## Something about the limit variable. What's wrong with the code?
## limit is not available in the method 
## 1) could fix by making a limit a constant which is global
## 2) could also pass as a parameter into the method
# LIMIT = 15
limit = 15
def fib(first_num, second_num, limit)
#  while second_num < LIMIT
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

def prompt(message)
  puts "=> #{message}"
end

prompt("Please enter an integer number:")
first_number = gets.chomp.to_i

prompt("Please enter an integer number:")
second_number = gets.chomp.to_i

# p fib(first_number, second_number)
p fib(first_number, second_number, limit)


