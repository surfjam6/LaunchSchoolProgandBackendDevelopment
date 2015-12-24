# valid_nember.rb
## Explore ways to handle number input for loan_calculator

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  if num.include? '$'  
     num.tr! '$', ''
  end
  if num.include? ','  
     num.tr! ',', ''
  end
  puts num
  # Handles input as a float num.0, dollar amount $num.00 or integer:
  (num.to_f.to_s == num) ||(num.to_f.to_s + '0' == num) || (num.to_i.to_s == num)
  # Tests for positive number:
  num.to_f >= 0 || num.to_i >= 0
end

loan_amount = ''
loop do
  prompt('Welcome to loan calculator, please enter loan amount (dollars):')
  loan_amount = gets.chomp
  if valid_number?(loan_amount)
    prompt('Valid Input.')
    break
  else 
    prompt('Please enter a valid number.')
  end
end