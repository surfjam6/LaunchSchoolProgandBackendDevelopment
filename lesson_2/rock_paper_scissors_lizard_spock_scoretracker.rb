# rock_paper_scissors_lizard_spock.rb
VALID_RESPONSES = %w[rock paper scissors lizard spock]
VALID_SHORTCUTS = {'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors', 'l' => 'lizard', 'sp' => 'spock'}
GAME_OVER_SCORE = 5
# GAME_OVER_SCORE = 2
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

def display_result(user, computer)
  if return_win?(user, computer)
    prompt("You won!")
  elsif return_win?(computer, user)
    prompt("Computer won!")
  else
    prompt("Tie!")
  end
end

def score_checker(winner_count)
  winner_count == GAME_OVER_SCORE
end

prompt("Welcome to the rock, paper, scissors, lizard, spock game.")
user_count = 0
computer_count = 0
loop do # main
  user_choice = ''
  loop do
    prompt("Please choose one -> rock (or r), paper (or p), scissors (or sc), \n lizard (or l), spock (or sp):")
    user_choice = gets.chomp.downcase
    # Check to see if you have a valid shortcut (key) and then fetch the assoc value:
    if VALID_RESPONSES.include?(VALID_SHORTCUTS.fetch(user_choice, "not valid"))
      user_choice = VALID_SHORTCUTS.fetch(user_choice, "not valid")
    end

    if VALID_RESPONSES.include?(user_choice)
      break
    else
      "Invalid choice, please re-enter:"
    end
  end

  computer_choice = VALID_RESPONSES.sample
  prompt("User choice is #{user_choice}, computer choice is #{computer_choice}")
#  display_result(user_choice,computer_choice)

  if return_win?(user_choice, computer_choice)
    prompt("You won!")
    user_count += 1
    if score_checker(user_count)
      prompt("Game over, you reached #{GAME_OVER_SCORE} first!!")
      # reset score
      user_count = 0
      computer_count = 0
    end
  elsif return_win?(computer_choice, user_choice)
    prompt("Computer won!")
    computer_count += 1
    if score_checker(computer_count)
      prompt("Game over, computer reached #{GAME_OVER_SCORE} first!!")
      # reset score
      user_count = 0
      computer_count = 0
    end
  else
    prompt("Tie!")
  end

  prompt("Do you want to play again? (y)")
  break unless gets.chomp.downcase.start_with?('y')
end
