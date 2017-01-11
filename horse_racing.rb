# Solution for https://www.codingame.com/ide/puzzle/horse-racing-duals
class HorseRacing
  def self.find_difference
    strenghts = start.sort
    strenghts.each_cons(2).map { |a, b| (b - a).abs }.min
  end

  def self.start
    n = gets.to_i
    strenghts_array = []
    n.times do
      pi = gets.to_i
      strenghts_array << pi
    end
    strenghts_array
  end
end

p HorseRacing.find_difference
