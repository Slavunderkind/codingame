# Solution for https://www.codingame.com/ide/puzzle/winamax-battle
class War
  attr_accessor :rounds, :player1, :player2, :stop

  def initialize
    @rounds = 0
    player1_cards_number = gets.to_i
    @player1 = Player.new(player1_cards_number)
    player2_cards_number = gets.to_i
    @player2 = Player.new(player2_cards_number)
    @stop = nil
  end

  def equal_game?
    player1.cards.size < 4 || player2.cards.size < 4
  end

  def war(p1_card, p2_card)
    if equal_game?
      self.stop = true
    else
      p1_war_cards = init_war_cards(player1.cards)
      p2_war_cards = init_war_cards(player2.cards)
      if player1.cards_on_table.any?
        player1.init_cards_on_table(p1_war_cards)
        player2.init_cards_on_table(p2_war_cards)
      else
        player1.init_cards_on_table(([p1_card] + p1_war_cards).flatten)
        player2.init_cards_on_table(([p2_card] + p2_war_cards).flatten)
      end
      battle(p1_war_cards.last, p2_war_cards.last)
    end
  end

  def init_war_cards(player_cards)
    Array.new(4) { player_cards.pop }
  end

  def battle(p1_card, p2_card)
    p1_strength = player1.card_strength(p1_card)
    p2_strength = player2.card_strength(p2_card)
    cards = [p1_card, p2_card]
    if player1.cards_on_table.any?
      cards = player1.cards_on_table + player2.cards_on_table
    end
    if p1_strength == p2_strength
      war(p1_card, p2_card)
    else
      if p1_strength > p2_strength
        player1.take_cards(cards)
      else
        player2.take_cards(cards)
      end
      clean_cards_on_table
    end
  end

  def clean_cards_on_table
    player1.clean_cards_on_table
    player2.clean_cards_on_table
  end

  def result
    if stop
      'PAT'
    else
      winner = 1
      winner = 2 if player1.cards.size < player2.cards.size
      "#{winner} #{rounds}"
    end
  end

  def start_game
    while !player1.cards.empty? && !player2.cards.empty? && stop.nil?
      self.rounds += 1
      battle(player1.cards.pop, player2.cards.pop)
    end
    result
  end
end

# Child class representing player
class Player
  attr_accessor :cards, :card_strength, :cards_on_table
  attr_reader :cards_number, :cards_strength

  def initialize(cards_number)
    @cards_strength = %w(2 3 4 5 6 7 8 9 10 J Q K A)
    @cards_number = cards_number
    @cards = init_cards
    @cards_on_table = []
  end

  def init_cards
    cards = Queue.new
    cards_number.times do
      cards << gets.chomp
    end
    cards
  end

  def card_strength(card)
    cards_strength.index(card[0...-1])
  end

  def take_cards(cards)
    cards.each do |card|
      self.cards << card
    end
  end

  def init_cards_on_table(cards)
    cards.each { |card| cards_on_table << card }
  end

  def clean_cards_on_table
    self.cards_on_table = []
  end
end

war = War.new
puts war.start_game
