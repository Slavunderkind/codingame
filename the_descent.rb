# Solution for https://www.codingame.com/ide/puzzle/the-descent
class TheDescent
  def find_heighest
    mountain_index = 0
    heighest = 0
    8.times do |i|
      mountain_h = gets.to_i # represents the height of one mountain.
      if mountain_h > heighest
        heighest = mountain_h
        mountain_index = i
      end
    end
    mountain_index
  end

  def start
    loop do
      p find_heighest
    end
  end
end

obj = TheDescent.new
obj.start
