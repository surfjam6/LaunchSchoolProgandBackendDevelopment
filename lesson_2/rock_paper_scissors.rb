# rock_paperscissors.rb

VALID_CHOICES = ['rock', 'paper', 'scissors']

def display_result(user, computer)
  if (user == 'rock' && computer == 'scissors') ||
     (user == 'paper' && computer == 'rock') ||
     (user =='scissors' && computer == 'paper')
    prompt("You won!")
  elsif (user == 'rock' && computer == 'paper') ||
        (user == 'paper' && computer == 'scissors') ||
        (user == 'scissors' && computer == 'rock')
    prompt("Computer won!")
  else
    prompt("Tie!")
  end
end
def test_method
  prompt("Hello")
end
# test_method
def prompt(message)
  puts "=> #{message}"
end
test_method

loop do # main

  user_choice = ''
  loop do
    prompt('Choose one...rock, paper, scissors')
    user_choice = gets.chomp
  
    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt('Not a valid choice, please re-enter')
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{user_choice}, computer chose #{computer_choice}")

  display_result(user_choice, computer_choice)

  prompt("Try again?:(Y/N)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
