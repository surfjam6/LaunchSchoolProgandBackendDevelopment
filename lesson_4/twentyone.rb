# twentyone.rb

SUIT = ["hearts","diamonds", "clubs", "spades"]
HEARTS_RANK = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
DIAMONDS_RANK = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
SPADES_RANK = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
CLUBS_RANK = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
MAX_SCORE = 21

def prompt(message)
  puts "=> #{message}"
end

def create_decK_cards
  {'hearts' => HEARTS_RANK, 'diamonds' => DIAMONDS_RANK, 'spades' => SPADES_RANK, 'clubs' =>  CLUBS_RANK}
end

def pick_card(dck)
  random_suit = SUIT[rand(SUIT.length)]   
  random_rank = dck[random_suit][rand(dck[random_suit].length)]
  {random_suit => random_rank}
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

def evaluate_hand(hand, user)
  sum_of_hand = 0
  hand.each do |x|
    if x.last.include?('K') || x.last.include?('Q') || x.last.include?('J')
      card = 10
    else
      card = x.last.to_i
    end
    if x.last.include?('A')
      if sum_of_hand <= 10
        sum_of_hand = sum_of_hand + 11
      else
        sum_of_hand = sum_of_hand + 1
      end
    else
      sum_of_hand = sum_of_hand + card
    end
  end
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
##

##
prompt("Welcome to the Twenty One Game, Dealing Cards....")
prompt("\n")


new_card = {}
player_hand = []
dealer_hand = []
deck = create_decK_cards
player_sum = 0
dealer_sum = 0

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

  loop do #Player turn:
    player_sum = evaluate_hand(player_hand, 'player')
    if player_sum >= MAX_SCORE
      display_win_or_bust(player_sum, 'player')
      break
    end
    prompt("hit or stay?")
    answer = gets.chomp.downcase
    break if answer == 's' || (answer == 'stay')
    player_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, player_hand)
    display_hand(player_hand, 'player')
  end

##player stay, compare player and dealer hands:
  dealer_sum = evaluate_hand(dealer_hand, 'dealer')
  if player_sum >= MAX_SCORE 
    # Player has won or busted, game over.
    break
  elsif (dealer_sum == MAX_SCORE) || (dealer_sum > player_sum)
    #check for dealer win with initial two cards then game over
    # Dealer cannot bust with 2 cards
    display_hand(dealer_hand, 'dealer')
    display_win_or_bust(dealer_sum, 'dealer')
    break
  end

  loop do #Dealer turn:
    puts "\n"
    prompt("Hit Dealer...")
    dealer_hand << pick_card(deck).to_a.flatten
    delete_from_deck(deck, dealer_hand)
    display_hand(dealer_hand, 'dealer')
    dealer_sum = evaluate_hand(dealer_hand, 'dealer')
    if dealer_sum >= MAX_SCORE || dealer_sum > player_sum
      display_win_or_bust(dealer_sum, 'dealer')
      break
    end
  end
  break
end # main
prompt("Goodbye!!")
