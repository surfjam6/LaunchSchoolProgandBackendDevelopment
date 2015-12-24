# calculator.rb
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
# puts MESSAGES.inspect

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end
##tr sub, gsub methods
prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

loop do # main
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets().chomp()
    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
      next
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets().chomp()
    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
      next
    end
  end
  prompt(MESSAGES['operation'])

  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Please choose 1,2,3,4")
    end
  end
  result = case operator
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             puts number2.inspect
             if number2 == '0'
               prompt("Cannot divide by zero.")
               "infinity"
             else
               number1.to_f() / number2.to_f()
             end
           end
  prompt("Result is #{result}")
  prompt("Do you want to perform another operation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Calculator exiting...")
