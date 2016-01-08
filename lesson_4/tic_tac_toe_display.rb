# tic-tac-toe display board
require 'pry'
def prompt (message)
  puts "=> #{message}"
end

def display_board(brd)
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
  (1..9).each {|mark| new_board[mark] = ' '}
  new_board
end

def empty_squares(brd)
  brd.keys.select {|num| brd[num] == ' '}
end
def board_full?(brd)
    if !brd.has_value?(' ')  # board has no blanks
      display_board(brd)
      prompt("GAME OVER!!")
      "true"
    else
      p "false"
    end
end

def good_user_entry?(brd, entry)
  if !brd.has_key?(entry)
    prompt("Incorrect entry, please re-enter")
  elsif brd[entry] != ' '
    prompt("Illegal entry, box previously selected, please re-enter")
  else
    brd[entry] = 'X'
  end
end

def enter_user_choice(brd)
  loop do # user choice:
    prompt ("Please choose a location to place \"X\" from (#{empty_squares(brd).join(", ")}):")
    user_choice = gets.chomp.to_i
    break if good_user_entry?(brd, user_choice)
  end
end

def computer_entry(brd)
 choices = '123456789'
 loop do
    p computer_entry = choices[rand(choices.length)]
    # Is computer entry legal/possible ?
    if brd[computer_entry.to_i] == ' '
      brd[computer_entry.to_i] = 'O'
      break
    end
  end
end

board = initialize_board
user_choice = ''
board_numbers = {1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9"}
display_board(board_numbers)
loop do # main
  enter_user_choice(board) 
  display_board(board)
#  break if board_full?(board) == "true"
  if board_full?(board) == "true"
    prompt("Would you like to play again? (Y/N)")
    end_game = gets.chomp
    break if end_game.downcase != 'y'
    board = initialize_board
  end

end # main
