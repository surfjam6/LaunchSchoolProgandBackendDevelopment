# car_loan_calc.rb
## The following formula is used to calculate
## the fixed monthly payment (P) required to fully amortize a loan of
## L dollars over a term of n months
## at a monthly interest rate of c.
## [If the quoted rate is 6%, for example, c is .06/12 or .005].
# P = L[c(1 + c)**n]/[(1 + c)**n - 1]

def prompt(message)
  puts "=> #{message}"
end

def calc_payment(c, l, n)
  l*(c*(1+c)**n) / ((1+c)**n-1)
end

# Method to check for valid loan amount input :
def valid_loan_amount?(num)
  num.tr! '$', '' if num.include? '$'
  num.tr! ',', '' if num.include? ','
  # Handles input as a float num.0, dollar amount $num.00 or integer:
  # "&&" tests for positive number:
  ((num.to_f.to_s == num) || (num.to_f.to_s + '0' == num) || (num.to_i.to_s == num)) && (num.to_f >= 0 || num.to_i >= 0)
end

def valid_number?(number)
  (number.to_i.to_s == number || number.to_f.to_s == number)
end

loop do # main
  loan_amount = ''
  loop do
    prompt('Welcome to loan calculator, please enter loan amount (dollars):')
    loan_amount = gets.chomp
    if valid_loan_amount?(loan_amount)
      loan_amount = loan_amount.to_f
      break
    else
      prompt('Please enter a valid number.')
    end
  end

  annual_percentage_rate = ''
  monthly_interest_rate = ''
  loop do
    prompt('Please enter Annual Percentage Rate (%):')
    annual_percentage_rate = gets.chomp
    if annual_percentage_rate.split(//).last == '%'
      annual_percentage_rate = annual_percentage_rate.chop!
    end
    if valid_number?(annual_percentage_rate)
      monthly_interest_rate = annual_percentage_rate.to_f/1200
      puts "Monthly interest rate = #{monthly_interest_rate}"
      break
    else puts "Please enter valid interest rate percentage:"
    end
  end

  loan_duration = ''
  loop do
    prompt('Please enter loan duration (years):')
    loan_duration = gets.chomp
    if valid_number?(loan_duration)
      loan_duration = loan_duration.to_i * 12
      puts "The loan_duration is #{loan_duration} months"
      payment = calc_payment(monthly_interest_rate, loan_amount, loan_duration)
      puts "Your payment would be: $#{payment.round(2)}"
      break
    else puts "Please enter valid loan length:"
    end
  end
  puts "Would you like to perform a new calculation? (Y/N)"
  new_calc = gets.chomp.downcase
  break unless new_calc.downcase.start_with?('y')
end
