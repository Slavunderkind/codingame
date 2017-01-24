# Solution for https://www.codingame.com/ide/puzzle/conway-sequence
class ConwaySequence
  attr_reader :first_number, :line_to_display, :sequence

  def initialize(first_number, line_to_display)
    @first_number = first_number
    @line_to_display = line_to_display
    @sequence = init_sequence
  end

  def init_sequence
    Array.new(line_to_display).each_with_index.each_with_object({}) do |(_, index), sequence|
      sequence[1] = [first_number] if index.zero?
      last_line = sequence[index + 1]
      sequence[index + 2] = next_line(last_line)
    end
  end

  def next_line(last_line)
    count = 0
    last_line.each_with_index.each_with_object([]) do |(num, index), result|
      count += 1
      next if num == last_line[index + 1]

      result << count
      result << num
      result.join(' ')
      count = 0
    end
  end

  def start
    sequence[line_to_display].join(' ')
  end
end

first_number = gets.to_i
line_to_display = gets.to_i
obj = ConwaySequence.new(first_number, line_to_display)
print obj.start
