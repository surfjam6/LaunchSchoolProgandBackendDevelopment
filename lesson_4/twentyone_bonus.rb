# twentyone.rb
SUIT = ["hearts", "diamonds", "clubs", "spades"]
MAX_SCORE = 21
MAX_GAMES = 5

def prompt(message)
  puts "=> #{message}"
end

def create_deck_cards
  hearts_rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  diamonds_rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  spades_rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  clubs_rank = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
  { 'hearts' => hearts_rank, 'diamonds' => diamonds_rank, 'spades' => spades_rank, 'clubs' => clubs_rank }
end

def pick_card(dck)
  random_suit = SUIT[rand(SUIT.length)]
  random_rank = dck[random_suit][rand(dck[random_suit].length)]
  { random_suit => random_rank }
end

def delete_from_deck(dck, hand)
  random_suit = hand.last[0]
  random_rank = hand.last[1]
  if dck[random_suit].include?(random_rank)
    dck[random_suit].delete(random_rank)
  end
end

def display_hand(hand, user)
  prompt("#{user.capitalize} hand is #{hand}\n")
end

def display_card(hand, user, sel=1)
  prompt("#{user.capitalize} hand is #{hand[sel]}")
end

def evaluate_hand(hand)
  sum_of_hand = 0
  ace_count = 0
  hand.each do |x|
    if x.last.include?('K') || x.last.include?('Q') || x.last.include?('J')
      card = 10
    elsif x.last.include?('A')
      ace_count += 1
      card = 11
    else
      card = x.last.to_i
    end
    sum_of_hand += card
  end # each
  loop do # ace handling
    if sum_of_hand > MAX_SCORE && (ace_count > 0)
        sum_of_hand -= 10
        ace_count -= 1
    else
      break
    end
  end # ace handling
  sum_of_hand
end

def display_win_or_bust(card_total, user)
  if card_total > MAX_SCORE
    prompt("#{user.capitalize} BUST! Game Over.")
  elsif card_total == MAX_SCORE
    prompt("#{MAX_SCORE}!! #{user.capitalize} has #{MAX_SCORE}!! Game Over.")
  else
    prompt("****#{user.capitalize} is winner! Game Over.****")
  end
end

def player_win?(score_hand)
  if score_hand['player'] == MAX_SCORE || score_hand['dealer'] > MAX_SCORE || ((score_hand['player'] > score_hand['dealer']) && !(score_hand['player'] > MAX_SCORE))
    true
  else
    false
  end
end

def declare_winner(user)
  prompt("WINNER!! #{user.capitalize} is first to reach #{MAX_GAMES}")
end

def increment_score!(scorebd, user)
  scorebd[user] += 1
end

def reset_scoreboard!
  { "player" => 0, "dealer" => 0 }
end

def reset_hand!
  { "player" => 0, "dealer" => 0 }
end

system "clear"
prompt("Welcome to the Twenty One Game, first to #{MAX_SCORE} wins a game.")
prompt("First player to reach #{MAX_GAMES} games wins the match. Dealing Cards....")
prompt("\n")
answer = ''
score_hand = reset_hand!
new_card = {}
player_hand = []
dealer_hand = []
deck = create_deck_cards
play_again = ''
game_over = false
match_over = false
scoreboard = reset_scoreboard!
loop do # main
  # initial deal:
  2.times do
    player_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, player_hand)
    dealer_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, dealer_hand)
  end
  prompt("Player Hand:")
  display_hand(player_hand, 'player')
  prompt("\n")
  prompt("Dealer Hand:")
  display_card(dealer_hand, 'dealer')
  prompt("\n")
  while answer == '' || answer == 'h' # Player turn
    score_hand['player'] = evaluate_hand(player_hand)
    if score_hand['player'] >= MAX_SCORE
      display_win_or_bust(score_hand['player'], 'player')
      break
    end
    loop do # check input/re-enter
      prompt("(h)it or (s)tay?")
      answer = gets.chomp.downcase
      break if ['h', 's'].include?(answer)
      prompt("Incorrect Entry, please re-enter")
    end # check input/re-enter
    break if answer == 's'
    player_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, player_hand)
    display_hand(player_hand, 'player')
  end # Player turn
  score_hand['player'] = evaluate_hand(player_hand)
  score_hand['dealer'] = evaluate_hand(dealer_hand)
  if score_hand['player'] >= MAX_SCORE
    # Player has won or busted, game over.
    game_over = true
    display_hand(dealer_hand, 'dealer')
  elsif (score_hand['dealer'] == MAX_SCORE) || (score_hand['dealer'] > score_hand['player'])
    # Check for dealer win with initial two cards => game over
    # Dealer cannot bust with 2 cards
    display_hand(dealer_hand, 'dealer')
    display_win_or_bust(score_hand['dealer'], 'dealer')
    game_over = true
  end

  while !game_over # Dealer turn
    puts "\n"
    prompt("Hit Dealer...")
    dealer_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, dealer_hand)
    display_hand(dealer_hand, 'dealer')
    score_hand["dealer"] = evaluate_hand(dealer_hand)
    if score_hand['dealer'] >= MAX_SCORE || score_hand['dealer'] > score_hand['player']
      display_win_or_bust(score_hand['dealer'], 'dealer')
      game_over = true
    end
  end
  prompt("Player sum = #{score_hand['player']}, Dealer sum = #{score_hand['dealer']}.")

  loop do # game over? loop
    if game_over
      if player_win?(score_hand)
        increment_score!(scoreboard, 'player')
      else
        increment_score!(scoreboard, 'dealer')
      end
      prompt("**********************************")
      prompt("Player Total = #{scoreboard['player']}, Dealer Total = #{scoreboard['dealer']}.")
      prompt("**********************************")
      prompt("**********************************")
      prompt("Hit any key to continue.")
      pause = gets.chomp
      system "clear"

      if scoreboard['player'] == MAX_GAMES
        declare_winner('player')
        match_over = true
      elsif scoreboard['dealer'] == MAX_GAMES
        declare_winner('dealer')
        match_over = true
      end
    end
    break
  end
  loop do # play again loop
    if match_over
      prompt("**********************************")
      prompt("**********************************")
      prompt("Play again? (Y/N)")
      play_again = gets.chomp.downcase
      break if ['y', 'n'].include?(play_again)
      prompt("Incorrect input please re-enter")
    else
      break
    end
  end # play again loop
  break if play_again == 'n'
  if match_over
    scoreboard = reset_scoreboard!
  end
  # Re-initialize for new game:
  answer = ''
  score_hand = reset_hand!
  new_card = {}
  player_hand = []
  dealer_hand = []
  deck = create_deck_cards # create new deck
  play_again = ''
  game_over = false
  match_over = false
end # main
prompt("Goodbye!! Thanks for playing.")
