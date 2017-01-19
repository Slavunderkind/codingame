STDOUT.sync = true # DO NOT REMOVE

# Solution for https://www.codingame.com/ide/puzzle/shadows-of-the-knight-episode-1
class Knight
  attr_accessor :width, :height, :jumps_number, :x, :y, :search_area

  def initialize
    @width, @height = gets.split(' ').collect(&:to_i)
    @jumps_number = gets.to_i # maximum number of turns before game over.
    @x, @y = gets.split(' ').collect(&:to_i)
    @search_area = [[0, 0], [@width - 1, @height - 1]]
  end

  def change_batman_position(direction)
    search_area[1][1] = y - 1 if direction.include?('U')
    search_area[0][1] = y + 1 if direction.include?('D')
    search_area[1][0] = x - 1 if direction.include?('L')
    search_area[0][0] = x + 1 if direction.include?('R')
  end

  def start
    loop do
      bomb_dir = gets.chomp
      change_batman_position(bomb_dir)
      self.x = search_area[0][0] + (search_area[1][0] - search_area[0][0]) / 2
      self.y = search_area[0][1] + (search_area[1][1] - search_area[0][1]) / 2
      puts "#{x} #{y}"
    end
  end
end

obj = Knight.new
obj.start
