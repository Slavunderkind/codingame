# Solution for https://www.codingame.com/ide/puzzle/scrabble
class Scrabble
  attr_accessor :dictionary, :letters, :letters_weight

  def initialize
    words_number = gets.to_i
    @dictionary = Array.new(words_number) { gets.chomp }
    @letters = gets.chomp
    @letters_weight = init_letters_weight
  end

  def init_letters_weight
    {
      1 => %w(e a i o n r t l s u),
      2 => %w(d g),
      3 => %w(b c m p),
      4 => %w(f h v w y),
      5 => %w(k),
      8 => %w(j x),
      10 => %w(q z)
    }
  end

  def matching?(word)
    word.each_char do |char|
      return false if letters.count(char) < word.count(char) || !letters.include?(char)
    end
    true
  end

  def find_all_words
    words_with_points = dictionary.each_with_object({}) do |word, result|
      result[word] = calculate_points(word) if matching?(word)
    end
    words_with_points.key(words_with_points.values.max)
  end

  def calculate_points(word)
    points = 0
    word.each_char do |char|
      letters_weight.each do |k, v|
        points += k if v.include?(char)
      end
    end
    points
  end
end

obj = Scrabble.new
answer = obj.find_all_words
puts answer
