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

def display_dealer_card_and_total(dealer_cards)
  card = dealer_cards.sample
  if card[1] == "Ace"
    puts "Dealer holds an #{card[1]} of #{card[0]} with a value of #{card[2][1]}."
  else
    puts "Dealer holds a #{card[1]} of #{card[0]} which has a value of: #{card[2]}."
  end
end

dealer_cards = [['Spades', 'Ace', [1, 11]]]
display_dealer_card_and_total(dealer_cards)
