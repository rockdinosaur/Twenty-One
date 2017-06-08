require 'pry'

DECK = [
  ['Spades', 'Ace', [1, 11]], ['Diamonds', 'Ace', [1, 11]],
  ['Spades', 'Two', 2],       ['Diamonds', 'Two', 2],
  ['Spades', 'Three', 3],     ['Diamonds', 'Three', 3],
  ['Spades', 'Four', 4],      ['Diamonds', 'Four', 4],
  ['Spades', 'Five', 5],      ['Diamonds', 'Five', 5],
  ['Spades', 'Six', 6],       ['Diamonds', 'Six', 6],
  ['Spades', 'Seven', 7],     ['Diamonds', 'Seven', 7],
  ['Spades', 'Eight', 8],     ['Diamonds', 'Eight', 8],
  ['Spades', 'Nine', 9],      ['Diamonds', 'Nine', 9],
  ['Spades', 'Ten', 10],      ['Diamonds', 'Ten', 10],
  ['Spades', 'Jack', 10],     ['Diamonds', 'Jack', 10],
  ['Spades', 'Queen', 10],    ['Diamonds', 'Queen', 10],
  ['Spades', 'King', 10],     ['Diamonds', 'King', 10],
  ['Hearts', 'Ace', [1, 11]], ['Clubs', 'Ace', [1, 11]],
  ['Hearts', 'Two', 2],       ['Clubs', 'Two', 2],
  ['Hearts', 'Three', 3],     ['Clubs', 'Three', 3],
  ['Hearts', 'Four', 4],      ['Clubs', 'Four', 4],
  ['Hearts', 'Five', 5],      ['Clubs', 'Five', 5],
  ['Hearts', 'Six', 6],       ['Clubs', 'Six', 6],
  ['Hearts', 'Seven', 7],     ['Clubs', 'Seven', 7],
  ['Hearts', 'Eight', 8],     ['Clubs', 'Eight', 8],
  ['Hearts', 'Nine', 9],      ['Clubs', 'Nine', 9],
  ['Hearts', 'Ten', 10],      ['Clubs', 'Ten', 10],
  ['Hearts', 'Jack', 10],     ['Clubs', 'Jack', 10],
  ['Hearts', 'Queen', 10],    ['Clubs', 'Queen', 10],
  ['Hearts', 'King', 10],     ['Clubs', 'King', 10]
]

# ------------------------------------METHODS-----------------------------
def prompt(message)
  puts "=> #{message}"
end

def initialize_deck
  DECK
end

def hit!(deck) # => picks a random card out of the remaining deck
  deck.delete(deck.sample)
end

def deal!(deck, player_cards, dealer_cards)
  player_cards << hit!(deck)
  player_cards << hit!(deck)
  dealer_cards << hit!(deck)
  dealer_cards << hit!(deck)
end

def hit_player!(deck, player_cards)
  player_cards << hit!(deck)
end

def hit_dealer!(deck, dealer_cards)
  dealer_cards << hit!(deck)
end

def hit_or_stay?
  prompt "Press 'y' to HIT or any other key to STAY."
  gets.chomp.downcase
end

def calculate_total(cards) # method for calculating total value in hand
  total_value = 0
  cards.each do |card|
    if card[1] == "Ace"
      if total_value <= 10
        total_value += card[2][1]
      else
        total_value += card[2][0]
      end
    else
      total_value += card[2]
    end
  end
  total_value
end

def display_player_cards_and_total(player_cards)
  cards = ''
  player_cards.each do |card|
    cards << "#{card[1]} of #{card[0]}, "
  end
  prompt "You have: #{cards}a total value of: #{calculate_total(player_cards)}"
end

# rubocop:disable Metrics/LineLength
def display_dealer_card_and_total(dealer_cards)
  card = dealer_cards.sample
  if card[1] == "Ace"
    prompt "Dealer holds an #{card[1]} of #{card[0]} with a value of #{card[2][1]}."
  else
    prompt "Dealer holds a #{card[1]} of #{card[0]} which has a value of: #{card[2]}."
  end
end
# rubocop:enable Metrics/LineLength

def bust?(cards)
  calculate_total(cards) > 21
end

# rubocop:disable Metrics/LineLength
def determine_winner(player_cards, dealer_cards)
  if calculate_total(player_cards) > calculate_total(dealer_cards)
    'Player'
  elsif calculate_total(player_cards) < calculate_total(dealer_cards)
    'Dealer'
  else
    false
  end
end
# rubocop:enable Metrics/LineLength

def play_again?
  prompt("Play again? 'y/n'")
  play_again = gets.chomp.downcase
  play_again.start_with?('y')
end

def display_scores(player_score, dealer_score)
  prompt("Your score: #{player_score}. Dealer score: #{dealer_score}")
  prompt("------------------------------------------------------")
end

# -----------------------------MAIN GAME LOGIC ---------------------------

loop do
  player_score = 0
  dealer_score = 0
  loop do
    deck = initialize_deck
    player_cards = []
    dealer_cards = []

    deal!(deck, player_cards, dealer_cards)
    display_player_cards_and_total(player_cards)
    display_dealer_card_and_total(dealer_cards)

    loop do
      choice = hit_or_stay?
      if choice.start_with?('y')
        hit_player!(deck, player_cards)
        display_player_cards_and_total(player_cards)
        if bust?(player_cards)
          dealer_score += 1
          prompt("You busted!")
          break
        end
      else
        if calculate_total(dealer_cards) <= 17
          loop do
            hit_dealer!(deck, dealer_cards)
            break if calculate_total(dealer_cards) >= 17
          end
        end
        if bust?(dealer_cards)
          player_score += 1
          prompt("Dealer busted. You win!")
          break
        else
          break
        end
      end
    end

    if !bust?(player_cards) && !bust?(dealer_cards)
      prompt("Your score: #{calculate_total(player_cards)}. Dealer score: #{calculate_total(dealer_cards)}")
      if determine_winner(player_cards, dealer_cards) == 'Player'
        player_score += 1
        prompt("You won this round..")
      elsif determine_winner(player_cards, dealer_cards) == 'Dealer'
        dealer_score += 1
        prompt("Dealer won this round..")
      else
        prompt("Draw.")
      end
    end

    display_scores(player_score, dealer_score)

    break if player_score >= 5 || dealer_score >= 5
    end
  if player_score >= 5
    prompt("Congrats! You won!")
    break unless play_again?
  elsif dealer_score >= 5
    prompt("You lost! The dealer beat you.")
    break unless play_again?
  end
end

prompt("Thanks for playing Twenty One!")
