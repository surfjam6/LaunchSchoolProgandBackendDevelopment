# twentyone.rb
SUIT = ["hearts", "diamonds", "clubs", "spades"]
MAX_SCORE = 21

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
  hand.each do |x|
    if x.last.include?('K') || x.last.include?('Q') || x.last.include?('J')
      card = 10
    elsif x.last.include?('A')
      if sum_of_hand <= 10
        card = 11
      else
        card = 1
      end
    else
      card = x.last.to_i
    end
    sum_of_hand += card
  end # each
  sum_of_hand
end

def display_win_or_bust(card_total, user)
  if card_total > MAX_SCORE
    prompt("#{user.capitalize} BUST! Game Over.")
  elsif card_total == MAX_SCORE
    prompt("BLACKJACK!! #{user.capitalize} has 21!! Game Over.")
  else
    prompt("#{user.capitalize} is winner! Game Over.")
  end
end

prompt("Welcome to the Twenty One Game, Dealing Cards....")
prompt("\n")

player_sum = 0
dealer_sum = 0
new_card = {}
player_hand = []
dealer_hand = []
deck = create_deck_cards
play_again = ''
game_over = 'false'
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
  answer = ''
  while answer == '' || answer == 'h' # Player turn
    player_sum = evaluate_hand(player_hand)
    if player_sum >= MAX_SCORE
      display_win_or_bust(player_sum, 'player')
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

  dealer_sum = evaluate_hand(dealer_hand)
  if player_sum >= MAX_SCORE
    # Player has won or busted, game over.
    game_over = 'true'
  elsif (dealer_sum == MAX_SCORE) || (dealer_sum > player_sum)
    # Check for dealer win with initial two cards => game over
    # Dealer cannot bust with 2 cards
    display_hand(dealer_hand, 'dealer')
    display_win_or_bust(dealer_sum, 'dealer')
    game_over = 'true'
  end

  while game_over == 'false' # Dealer turn
    puts "\n"
    prompt("Hit Dealer...")
    dealer_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, dealer_hand)
    display_hand(dealer_hand, 'dealer')
    dealer_sum = evaluate_hand(dealer_hand)
    if dealer_sum >= MAX_SCORE || dealer_sum > player_sum
      display_win_or_bust(dealer_sum, 'dealer')
      game_over = 'true'
    end
  end
  prompt("Player sum = #{player_sum}, Dealer sum = #{dealer_sum}.")

  loop do
    if game_over
      prompt("**********************************")
      prompt("**********************************")
      prompt("Play again? (Y/N)")
      play_again = gets.chomp.downcase
      break if ['y', 'n'].include?(play_again)
      prompt("Incorrect input please re-enter")
    else
      break
    end
  end
  break if play_again == 'n'
  # Re-initialize for new game:
  system "clear"
  player_sum = 0
  dealer_sum = 0
  new_card = {}
  player_hand = []
  dealer_hand = []
  deck = create_deck_cards # create new deck
  play_again = ''
  game_over = 'false'
end # main
prompt("Goodbye!! Thanks for playing.")
