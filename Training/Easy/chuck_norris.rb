# Solution for https://www.codingame.com/ide/puzzle/chuck-norris
class ChuckNorris
  attr_accessor :message

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
    result = []
    c = 0
    array.each_with_index do |item, index|
      c += 1
      next if item == array[index + 1]
      a = [item, c]
      result << a
      c = 0
    end
    result
  end

  def norris_parse(series_array)
    result = ''
    series_array.each do |a|
      result += if a[0].zero?
                  '00 '
                else
                  '0 '
                end
      result += '0' * a[1] + ' '
    end
    result.strip
  end

  def start
    binary = @message.each_char.each_with_object('') do |char, b|
      b << convert_in_binary(convert_in_ascii(char))
    end
    array = split_series(binary.each_char.map(&:to_i))
    output = norris_parse(array)
    puts output
  end
end

obj = ChuckNorris.new
obj.start
