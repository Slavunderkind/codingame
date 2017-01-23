STDOUT.sync = true # DO NOT REMOVE
# Solution for https://www.codingame.com/ide/puzzle/there-is-no-spoon-episode-1
class Spoon
  attr_accessor :nodes
  attr_reader :width, :height

  def initialize(width, height)
    @width = width # the number of cells on the X axis
    @height = height # the number of cells on the Y axis
    @nodes = []
    init_nodes
  end

  def init_nodes
    Array.new(height) do |line_index|
      line = gets.chomp
      line.each_char.with_index do |char, char_index|
        next if char == '.'

        nodes << [char_index, line_index]
      end
    end
  end

  def find_right_node(node)
    nodes.select { |n| n[1] == node[1] && n[0] > node[0] }.min
  end

  def find_bottom_node(node)
    nodes.select { |n| n[0] == node[0] && n[1] > node[1] }.min
  end

  def add_coordinates(result)
    result ? [result[0], result[1]] : [-1, -1]
  end

  def start
    nodes.map do |node|
      result = node
      result << add_coordinates(find_right_node(node))
      result << add_coordinates(find_bottom_node(node))
      result.flatten.join(' ')
    end
  end
end

obj = Spoon.new(gets.to_i, gets.to_i)
answer = obj.start
puts answer
