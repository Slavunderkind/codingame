# Solution for https://www.codingame.com/ide/puzzle/winamax-battle
class War
  attr_accessor :rounds, :player1, :player2, :stop, :p1_war_cards, :p2_war_cards, :p1_card, :p2_card

  def initialize
    @rounds = 0
    player1_cards_number = gets.to_i
    @player1 = Player.new(player1_cards_number)
    player2_cards_number = gets.to_i
    @player2 = Player.new(player2_cards_number)
  end

  def equal_game?
    player1.cards.size < 4 || player2.cards.size < 4
  end

  def chained_war_cards
    p1_war_cards.unshift(p1_card)
    p2_war_cards.unshift(p2_card)
  end

  def war
    init_war_cards
    chained_war_cards if player1.cards_on_table.empty?
    player1.init_cards_on_table(p1_war_cards)
    player2.init_cards_on_table(p2_war_cards)
  end

  def init_war_cards
    self.p1_war_cards = Array.new(4) { player1.cards.pop }
    self.p2_war_cards = Array.new(4) { player2.cards.pop }
  end

  def equal_cards
    if equal_game?
      self.stop = true
    else
      war
      battle
    end
  end

  def compare_players_cards
    p1_strength = player1.card_strength(p1_card)
    p2_strength = player2.card_strength(p2_card)
    equal_cards if p1_strength == p2_strength
    cards = player1.cards_on_table + player2.cards_on_table
    if p1_strength > p2_strength
      player1.take_cards(cards)
    else
      player2.take_cards(cards)
    end
  end

  def battle
    self.p1_card = player1.cards_on_table.last
    self.p2_card = player2.cards_on_table.last
    compare_players_cards
    clean_cards_on_table
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

  def game_not_ended?
    !player1.cards.empty? && !player2.cards.empty? && stop.nil?
  end

  def start_game
    while game_not_ended?
      self.rounds += 1
      player1.init_cards_on_table([player1.cards.pop])
      player2.init_cards_on_table([player2.cards.pop])
      battle
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
