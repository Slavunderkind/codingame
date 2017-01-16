# Solution for https://www.codingame.com/ide/puzzle/ascii-art
class AsciiArt
  attr_accessor :ascii_style, :letter_width, :letter_height, :word, :lines

  def initialize
    @ascii_style = ('A'..'Z').to_a << '?'
    @letter_width = gets.to_i
    @letter_height = gets.to_i
    @word = gets.chomp
  end

  def letter_index(letter)
    index = ascii_style.find_index(letter.upcase)
    index ? index : ascii_style.size - 1
  end

  def start
    letter_height.times do
      row = gets.chomp
      splitted_row = row.scan(/.{#{letter_width}}|./)
      line = word.chars.map { |letter| splitted_row[letter_index(letter)] }.join
      puts line
    end
  end
end

obj = AsciiArt.new
obj.start
