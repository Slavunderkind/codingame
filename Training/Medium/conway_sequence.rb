# Solution for https://www.codingame.com/ide/puzzle/conway-sequence
class ConwaySequence
  attr_accessor :first_number, :line_to_display, :sequence

  def initialize
    @first_number = gets.to_i
    @line_to_display = gets.to_i
  end

  def init_sequence
    sequence = {}
    sequence[1] = [first_number]
    line_to_display.times.each_with_index do |line, index|
      last_line = sequence[index + 1]
      sequence[index + 2] = next_line(last_line)
    end
    sequence
  end

  def next_line(last_line)
    count = 0
    result = []
    last_line.each_with_index do |num, index|
      count += 1
      next if num == last_line[index + 1]
      result << [count, num]
      count = 0
    end
    result.flatten
  end

  def start
    sequence = init_sequence
    sequence[line_to_display].join(' ')
  end
end

obj = ConwaySequence.new
print obj.start
