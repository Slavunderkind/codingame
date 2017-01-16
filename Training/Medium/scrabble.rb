# Solution for https://www.codingame.com/ide/puzzle/scrabble
class Scrabble
  attr_accessor :words_count, :dictionary, :letters, :letters_weight

  def initialize
    @n = gets.to_i
    @dictionary = @n.times.each_with_object([]) { |_, result| result << gets.chomp }
    @letters = gets.chomp
    @letters_weight = init_letters_weight
  end

  def init_letters_weight
    letters_weight = {}
    letters_weight[1] = %w(e a i o n r t l s u)
    letters_weight[2] = %w(d g)
    letters_weight[3] = %w(b c m p)
    letters_weight[4] = %w(f h v w y)
    letters_weight[5] = ['k']
    letters_weight[8] = %w(j x)
    letters_weight[10] = %w(q z)
    letters_weight
  end

  def matching?(word)
    word.each_char do |char|
      return false if letters.count(char) < word.count(char) || !letters.include?(char)
    end
    true
  end

  def find_all_words
    words_with_points = {}
    dictionary.find_all do |word|
      words_with_points[word] = calculate_points(word) if matching?(word)
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

  def start
    puts find_all_words
  end
end

obj = Scrabble.new
obj.start
