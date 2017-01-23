# Solution for https://www.codingame.com/ide/puzzle/chuck-norris
class ChuckNorris
  attr_reader :message

  def initialize
    @message = gets.chomp
  end

  def convert_in_ascii(char)
    char.ord
  end

  def convert_in_binary(char)
    char.to_s(2).rjust(7, '0')
  end

  def split_series(array)
    count = 0
    array.each_with_object([]).each_with_index do |(item, result), index|
      count += 1
      next if item == array[index + 1]
      result << [item, count]
      count = 0
    end
  end

  def norris_parse(series_array)
    parsed = series_array.each_with_object([]) do |serie, result|
      # serie[0].zero? ? result << '00' : result << '0'
      result << if a[0].zero?
                  '00'
                else
                  '0'
                end
      result << '0' * serie[1]
    end
    parsed.join(' ')
  end

  def start
    binary = ''
    message.chars do |char|
      binary << convert_in_binary(convert_in_ascii(char))
    end
    array = split_series(binary.chars.map(&:to_i))
    norris_parse(array)
  end
end

obj = ChuckNorris.new
puts obj.start
