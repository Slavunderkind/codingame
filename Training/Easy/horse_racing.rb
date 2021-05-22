# Solution for https://www.codingame.com/ide/puzzle/horse-racing-duals
class HorseRacing
  attr_reader :horses_count, :strengths

  def initialize(horses_count)
    @horses_count = horses_count
    @strengths = init_strengths
  end

  def init_strengths
    Array.new(horses_count) { gets.to_i }.sort
  end

  def find_difference
    strengths.each_cons(2).map { |a, b| (b - a).abs }.min
  end
end

horses_count = gets.to_i
obj = HorseRacing.new(horses_count)
puts obj.find_difference
