# Solution for https://www.codingame.com/ide/puzzle/temperatures
class Temperatures
  attr_accessor :number, :temps

  def initialize
    @n = gets.to_i
    @temps = gets.chomp
  end

  def start
    approx = temps.split(' ').first.to_i
    temps.split(' ').each do |temp|
      t = temp.to_i
      approx = t if t.abs < approx.abs || approx < 0 && approx.abs == t.abs
    end
    puts approx
  end
end

obj = Temperatures.new
obj.start
