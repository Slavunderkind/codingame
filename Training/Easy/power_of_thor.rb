STDOUT.sync = true # DO NOT REMOVE
# Solution for https://www.codingame.com/ide/puzzle/power-of-thor-episode-1
class Thor
  attr_accessor :light_x, :light_y, :x, :y

  def initialize
    @light_x, @light_y, @x, @y = gets.split(' ').collect(&:to_i)
  end

  def move_north
    self.y -= 1
    if x == light_x
      puts 'N'
    elsif x > light_x
      self.x -= 1
      puts 'NW'
    else
      self.x += 1
      puts 'NE'
    end
  end

  def move_south
    self.y += 1
    if x == light_x
      puts 'S'
    elsif x > light_x
      self.x -= 1
      puts 'SW'
    else
      self.x += 1
      puts 'SE'
    end
  end

  def move_west
    self.x -= 1
    puts 'W'
  end

  def move_east
    self.x += 1
    puts 'E'
  end

  def find_direction
    move_west if y == light_y && x > light_x
    move_east if y == light_y && x < light_x
    move_north if y > light_y
    move_south if y < light_y
  end

  def start
    loop do
      find_direction
    end
  end
end

thor = Thor.new
thor.start
