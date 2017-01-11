# Solution for https://www.codingame.com/ide/puzzle/ascii-art
class AsciiArt
  attr_accessor :ascii_style, :letter_width, :letter_height, :word, :lines

  def initialize
    letters = ('A'..'Z').to_a
    @ascii_style = letters << '?'
    @letter_width = gets.to_i
    @letter_height = gets.to_i
    @word = gets.chomp
  end

  def letter_index(letter)
    if ascii_style.find_index(letter.upcase)
      ascii_style.find_index(letter.upcase)
    else
      ascii_style.size - 1
    end
  end

  def start
    letter_height.times do
      row = gets.chomp
      splitted_row = row.scan(/.{#{letter_width}}|./)
      line = ''
      word.each_char do |letter|
        line += splitted_row[letter_index(letter)]
      end
      puts line
    end
  end
end

obj = AsciiArt.new
obj.start
