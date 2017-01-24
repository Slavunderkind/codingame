STDOUT.sync = true # DO NOT REMOVE
# Solution for https://www.codingame.com/ide/puzzle/power-of-thor-episode-1
class Thor
  attr_accessor :light_x, :light_y, :x, :y

  def initialize(light_x, light_y, thor_x, thor_y)
    @light_x = light_x
    @light_y = light_y
    @x = thor_x
    @y = thor_y
  end

  def move_north
    self.y -= 1
    if x == light_x
      'N'
    elsif x > light_x
      self.x -= 1
      'NW'
    else
      self.x += 1
      'NE'
    end
  end

  def move_south
    self.y += 1
    if x == light_x
      'S'
    elsif x > light_x
      self.x -= 1
      'SW'
    else
      self.x += 1
      'SE'
    end
  end

  def move_west
    self.x -= 1
    'W'
  end

  def move_east
    self.x += 1
    'E'
  end

  def find_direction
    if y == light_y && x > light_x
      move_west
    elsif y == light_y && x < light_x
      move_east
    elsif y > light_y
      move_north
    else
      move_south
    end
  end

  def start
    loop do
      puts find_direction
    end
  end
end

light_x, light_y, x, y = gets.split(' ').collect(&:to_i)
thor = Thor.new(light_x, light_y, x, y)
thor.start
