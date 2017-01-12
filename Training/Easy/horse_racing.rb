# Solution for https://www.codingame.com/ide/puzzle/horse-racing-duals
class HorseRacing
  attr_accessor :horses_number

  def initialize
    @horses_number = gets.to_i
  end

  def find_difference
    strenghts = init_strenghts
    strenghts.each_cons(2).map { |a, b| (b - a).abs }.min
  end

  def init_strenghts
    strenghts_array = []
    horses_number.times do
      horse_strenght = gets.to_i
      strenghts_array << horse_strenght
    end
    strenghts_array.sort
  end

  def start
    puts find_difference
  end
end

obj = HorseRacing.new
obj.start
