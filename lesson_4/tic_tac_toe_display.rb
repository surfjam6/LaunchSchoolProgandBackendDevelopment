# tic-tac-toe display board
require 'pry'

EMPTY_SQUARE_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt (message)
  puts "=> #{message}"
end

def display_board(brd)
  system "clear"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts "     |     |"
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each {|mark| new_board[mark] = EMPTY_SQUARE_MARKER}
  new_board
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == EMPTY_SQUARE_MARKER}
end

def display_result(winner)
  if winner == 'X'
    puts 'You won!!'
  elsif winner == 'O'
    puts "Computer wins!!"
  elsif winner == 'board_full'
    puts "Tie!!"
  end
end

def board_full?(brd, won)
  if empty_squares(brd).empty? && won != true # handles condition of win when board is also full
    display_result('board_full')
    return true
  end
end

def good_user_entry!(brd, entry)
  if !brd.has_key?(entry)
    prompt("Incorrect entry, please re-enter")
  elsif brd[entry] != EMPTY_SQUARE_MARKER
    prompt("Illegal entry, box previously selected, please re-enter")
  else
    brd[entry] = USER_MARKER
  end
end

def enter_user_choice(brd)
  loop do # user choice:
    prompt ("Please choose a location to place \"X\" from (#{empty_squares(brd).join(", ")}):")
    user_choice = gets.chomp.to_i
    break if good_user_entry!(brd, user_choice)
  end
end

def computer_entry!(brd)
  computer_entry = empty_squares(brd).sample
  brd[computer_entry] = COMPUTER_MARKER
end

def return_winner(brd, marker) 
  win = (brd[1] == marker && brd[2] == marker && brd[3] == marker) ||
  (brd[4] == marker && brd[5] == marker && brd[6] == marker) ||
  (brd[7] == marker && brd[8] == marker && brd[9] == marker) ||
  (brd[1] == marker && brd[4] == marker && brd[7] == marker) ||
  (brd[2] == marker && brd[5] == marker && brd[8] == marker) ||
  (brd[3] == marker && brd[6] == marker && brd[9] == marker) ||
  (brd[1] == marker && brd[5] == marker && brd[9] == marker) ||
  (brd[3] == marker && brd[5] == marker && brd[7] == marker)
  if win 
    display_result(marker)
  end
  return win
end

winner = ''
board = initialize_board
user_choice = ''
board_numbers = {1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9"}
display_board(board_numbers)
loop do # main
  # User play:
  enter_user_choice(board)
  display_board(board)
  winner = return_winner(board, USER_MARKER)
# Note: if you choose to play again, computer will go first.
  if board_full?(board, winner) || winner == true
    ##   detect winner and print message
    prompt("Would you like to play again? (Y/N)")
    end_game = gets.chomp
    break if end_game.downcase != 'y'
    board = initialize_board
  end
  
  # Computer play:
  computer_entry!(board)
  display_board(board)
  winner = return_winner(board, COMPUTER_MARKER)
# Note: if you choose to play again, user will go first.
  if board_full?(board, winner) || winner == true
    ##   detect winner and print message
    prompt("Would you like to play again? (Y/N)")
    end_game = gets.chomp
    break if end_game.downcase != 'y'
    board = initialize_board
  end
  display_board(board)
end # main
