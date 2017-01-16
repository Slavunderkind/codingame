STDOUT.sync = true # DO NOT REMOVE
# Solution for https://www.codingame.com/ide/puzzle/there-is-no-spoon-episode-1
class Spoon
  attr_accessor :width, :height, :nodes

  def initialize
    @width = gets.to_i # the number of cells on the X axis
    @height = gets.to_i # the number of cells on the Y axis
    @nodes = []
    init_nodes
  end

  def init_nodes
    n = 0
    height.times do
      line = gets.chomp # width characters, each either 0 or .
      find_node(line, n)
      n += 1
    end
  end

  def find_node(chars, n)
    chars.each_char.with_index do |char, i|
      next if char == '.'

      nodes.push([i, n])
    end
  end

  def find_right_node(node)
    nodes.select { |n| n if n[1] == node[1] && n[0] > node[0] }.min
  end

  def find_bottom_node(node)
    nodes.select { |n| n if n[0] == node[0] && n[1] > node[1] }.min
  end

  def add_coordinates(result)
    if result.nil?
      ' -1 -1'
    else
      " #{result[0]} #{result[1]}"
    end
  end

  def start
    nodes.each do |node|
      result = "#{node[0]} #{node[1]}"
      result += add_coordinates(find_right_node(node))
      result += add_coordinates(find_bottom_node(node))
      puts result
    end
  end
end

obj = Spoon.new
obj.start
