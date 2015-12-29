# rock_paper_scissors_lizard_spock.rb
VALID_RESPONSES = %w[rock paper scissors lizard spock]

def prompt(message)
  puts "=> #{message}"
end

def return_win?(user, computer)
  (user == 'rock' && computer == 'scissors') ||
  (user == 'rock' && computer == 'lizard') ||
  (user == 'paper' && computer == 'rock') ||
  (user == 'paper' && computer == 'spock') ||
  (user == 'scissors' && computer == 'paper') ||
  (user == 'scissors' && computer == 'lizard') ||
  (user == 'spock' && computer == 'rock') ||
  (user == 'spock' && computer == 'scissors') ||
  (user == 'lizard' && computer == 'spock') ||
  (user == 'lizard' && computer == 'paper')
end
def display_result(user,computer)
  if return_win?(user, computer)
    prompt("You won!")
  elsif return_win?(computer, user)
    prompt("Computer won!")
  else
    prompt("Tie!")
  end
end

prompt("Welcome to the rock, paper, scissors, lizard, spock game.")
loop do # main

  valid_shortcuts = {'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors', 'l' => 'lizard', 'sp' => 'spock'}
  user_choice = ''
  loop do
    prompt("Please choose one -> rock (or r), paper (or p), scissors (or sc), \n lizard (or l), spock (or sp):")
    user_choice = gets.chomp.downcase
    # Check to see if you have a valid shortcut (key) and then fetch the assoc value:
    if VALID_RESPONSES.include?(valid_shortcuts.fetch(user_choice, "not valid"))
      user_choice = valid_shortcuts.fetch(user_choice, "not valid")
    end

    if VALID_RESPONSES.include?(user_choice)
      break
    else
      "Invalid choice, please re-enter:"
    end
  end

  computer_choice = VALID_RESPONSES.sample
  prompt("User choice is #{user_choice}, computer choice is #{computer_choice}")
  display_result(user_choice,computer_choice)
  
  prompt("Do you want to play again? (y)")
  break unless gets.chomp.downcase.start_with?('y')
end