STDOUT.sync = true # DO NOT REMOVE
# Solution for https://www.codingame.com/ide/puzzle/power-of-thor-episode-1
class Thor
  attr_accessor :light_x, :light_y, :x, :y

  def initialize
    @light_x, @light_y, @x, @y = gets.split(' ').collect(&:to_i)
  end

  def find_direction
    direction = ''
    if x < light_x
      direction = 'E'
      if y > light_y
        direction = 'NE'
      else
        direction = 'SE' unless y == light_y
      end
    elsif x == light_x
      if y > light_y
        direction = 'N'
      else
        direction = 'S'
      end
    else
      direction = 'W'
      if y > light_y
        direction = 'NW'
      else
        direction = 'SW' unless y == light_y
      end
    end
    move(direction)
    direction
  end

  def move(direction)
    case direction
    when 'N' then self.y -= 1
    when 'NE'
      self.y -= 1
      self.x += 1
    when 'E' then self.x += 1
    when 'SE'
      self.x += 1
      self.y += 1
    when 'S' then self.y += 1
    when 'SW'
      self.y += 1
      self.x -= 1
    when 'W' then self.x -= 1
    when 'NW'
      self.x -= 1
      self.y -= 1
    end
  end

  def start
    loop do
      remaining_turns = gets.to_i # The remaining amount of turns Thor can move. Do not remove this line.
      puts find_direction
    end
  end
end

thor = Thor.new
thor.start
