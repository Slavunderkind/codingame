# Solution for https://www.codingame.com/ide/puzzle/ascii-art
class AsciiArt
  attr_accessor :ascii_style, :letter_width, :letter_height, :word

  def initialize
    @letter_width = gets.to_i
    @letter_height = gets.to_i
    @word = gets.chomp
  end

  def start
    Array.new(letter_height) do
      row = gets.chomp
      splitted_row = row.scan(/.{#{letter_width}}|./)
      word.chars.map { |char| AsciiArt::Letter.new(splitted_row, char).in_ascii }.join
    end
  end

  # Represent letter
  class Letter
    attr_accessor :row, :char
    LETTERS = ('A'..'Z').to_a << '?'

    def initialize(row, char)
      @row = row
      @char = char
    end

    def letter_index(letter)
      index = LETTERS.find_index(letter.upcase)
      index ? index : LETTERS.size - 1
    end

    def in_ascii
      row[letter_index(char)]
    end
  end
end

obj = AsciiArt.new
puts obj.start.join("\n")
