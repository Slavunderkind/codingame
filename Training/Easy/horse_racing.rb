# Solution for https://www.codingame.com/ide/puzzle/horse-racing-duals
class HorseRacing
  attr_accessor :horses_count

  def initialize
    @horses_count = gets.to_i
  end

  def find_difference
    strengths = init_strengths
    strengths.each_cons(2).map { |a, b| (b - a).abs }.min
  end

  def init_strengths
    horses_count.times.each_with_object([]) { |_, result| result << gets.to_i }.sort
  end

  def start
    puts find_difference
  end
end

obj = HorseRacing.new
obj.start
