# Solution for https://www.codingame.com/ide/puzzle/horse-racing-duals
class HorseRacing
  def find_difference
    strenghts = init_strenghts
    strenghts.each_cons(2).map { |a, b| (b - a).abs }.min
  end

  def init_strenghts
    n = gets.to_i
    strenghts_array = []
    n.times do
      pi = gets.to_i
      strenghts_array << pi
    end
    strenghts_array.sort
  end

  def start
    puts find_difference
  end
end

obj = HorseRacing.new
obj.start
