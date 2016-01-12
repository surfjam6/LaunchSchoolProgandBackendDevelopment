# tic-tac-toe display board
require 'pry'

FINAL_SCORE = 5
EMPTY_SQUARE_MARKER = ' '
USER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(message)
  puts "=> #{message}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
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
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |mark| new_board[mark] = EMPTY_SQUARE_MARKER }
  new_board
end

def reset_scoreboard(score_hash)
    score_hash["User"] = 0
    score_hash["Computer"] = 0
end

def joinor(input, delimiter, word = 'or')
  input[input.index(input.last)] = "#{word} #{input.last}"  
  input.join(delimiter)
end

def empty_squares?(brd)
  brd.keys.select { |num| brd[num] == EMPTY_SQUARE_MARKER }
end

def board_empty?(brd)
  brd.values_at(1, 2, 3, 4, 5, 6, 7, 8, 9).count(EMPTY_SQUARE_MARKER) == 9
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
  if empty_squares?(brd).empty? && won != true # Tie condition
    display_result('board_full')
    return true
  end
end

def good_user_entry!(brd, entry)
  if !brd.key?(entry)
    prompt("Incorrect entry, please re-enter")
  elsif brd[entry] != EMPTY_SQUARE_MARKER
    prompt("Illegal entry, box previously selected, please re-enter")
  else
    brd[entry] = USER_MARKER
  end
end

def enter_user_choice(brd)
  loop do # user choice:
    prompt "Please choose a location to place \"X\" at (#{joinor(empty_squares?(brd), ', ')}):"
    user_choice = gets.chomp.to_i
    break if good_user_entry!(brd, user_choice)
  end
end

def detect_possible_moves(brd, marker)
  if board_empty?(brd) # if board is empty, place marker in middle of board
    save_move = [5]
  elsif brd.values_at(1, 2, 3).count(marker) == 2 && brd.values_at(1, 2, 3).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [1, 2, 3]
  elsif brd.values_at(4, 5, 6).count(marker) == 2 && brd.values_at(4, 5, 6).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [4, 5, 6]
  elsif brd.values_at(7, 8, 9).count(marker) == 2 && brd.values_at(7, 8, 9).count(EMPTY_SQUARE_MARKER) == 1
    save_move =[7, 8, 9]
  elsif brd.values_at(1, 4, 7).count(marker) == 2 && brd.values_at(1, 4, 7).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [1, 4, 7]
  elsif brd.values_at(2, 5, 8).count(marker) == 2 && brd.values_at(2, 5, 8).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [2, 5, 8]
  elsif brd.values_at(3, 6, 9).count(marker) == 2 && brd.values_at(3, 6, 9).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [3, 6, 9]
  elsif brd.values_at(1, 5, 9).count(marker) == 2 && brd.values_at(1, 5, 9).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [1, 5, 9]
  elsif brd.values_at(3, 5, 7).count(marker) == 2 && brd.values_at(3, 5, 7).count(EMPTY_SQUARE_MARKER) == 1
    save_move = [3, 5, 7]
  else save_move = []
  end
  if save_move != [] && save_move != [5] 
    save_move.select! { |num|  empty_squares?(brd).include?(num) }
  end
  save_move
end


def computer_entry!(brd)
  keep_move = detect_possible_moves(brd, COMPUTER_MARKER) # find winning move 
  if keep_move != []
# debug   puts "Not Random -> Offense"
    brd[keep_move[0]] = COMPUTER_MARKER 
  else keep_move = detect_possible_moves(brd, USER_MARKER) # find defensive move 
    if keep_move != []
# debug     puts "Not Random -> Defense"
      brd[keep_move[0]] = COMPUTER_MARKER 
    else  
# debug     puts "Random move"
      computer_entry = empty_squares?(brd).sample  # random computer move
      brd[computer_entry] = COMPUTER_MARKER
    end
  end

end

def return_winner(brd, marker)
  win = brd.values_at(1, 2, 3).count(marker) == 3 ||
        brd.values_at(4, 5, 6).count(marker) == 3 ||
        brd.values_at(7, 8, 9).count(marker) == 3 ||
        brd.values_at(1, 4, 7).count(marker) == 3 ||
        brd.values_at(2, 5, 8).count(marker) == 3 ||
        brd.values_at(3, 6, 9).count(marker) == 3 ||
        brd.values_at(1, 5, 9).count(marker) == 3 ||
        brd.values_at(3, 5, 7).count(marker) == 3
  if win
    display_result(marker)
  end
  return win
end

def keep_score(scorer, score_hash)
  if scorer == 'User'
    score_hash[scorer] += 1
  elsif scorer == 'Computer'
    score_hash[scorer] += 1
  end
  prompt "Score *** User: #{score_hash["User"]} Computer: #{score_hash["Computer"]} ***"
  if score_hash.has_value?(FINAL_SCORE) 
    prompt "#{scorer} is the WINNER!!"
    reset_scoreboard(score_hash)
  end
end


score_hash = {"User" => 0, "Computer" => 0}
winner = ''
board = initialize_board
board_numbers = { 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }
display_board(board_numbers)
loop do # main
  # User play:
  enter_user_choice(board)
  display_board(board)
  winner = return_winner(board, USER_MARKER)
  keep_score('User', score_hash) if winner == true 

  # Note: if you choose to play again, Computer will go first.
  if board_full?(board, winner) || winner == true
  ## detect winner and print message:
    prompt("Would you like to play again? (Y/N)")
    end_game = gets.chomp
    break if end_game.downcase != 'y'
    board = initialize_board
  end

  # Computer play:
  computer_entry!(board)
  display_board(board)
  winner = return_winner(board, COMPUTER_MARKER)
  keep_score('Computer', score_hash) if winner == true 

  # Note: if you choose to play again, User will go first.
  if board_full?(board, winner) || winner == true
  ## detect winner and print message:
    prompt("Would you like to play again? (Y/N)")
    end_game = gets.chomp
    break if end_game.downcase != 'y'
    board = initialize_board
  end
  display_board(board)
end # main
