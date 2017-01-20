# Solution for https://www.codingame.com/ide/puzzle/defibrillators
class Defibrillators
  attr_accessor :lon, :lat, :defibrilators_count, :defibrillators

  def initialize
    @lon = degrees_to_radians(gets.chomp)
    @lat = degrees_to_radians(gets.chomp)
    @defibrilators_count = gets.to_i
    @defibrillators = {}
  end

  def calculate_x(d_long, d_lat)
    c = Math.cos((lat + d_lat) / 2)
    (d_long - lon) * c
  end

  def calculate_y(d_lat)
    d_lat - lat
  end

  def distance(x, y)
    Math.sqrt(x * x + y * y) * 6371
  end

  def degrees_to_radians(degrees)
    (degrees.sub(',', '.').to_f * Math::PI) / 180
  end

  def add_defibrillator(defibrillator)
    d_long = degrees_to_radians(defibrillator[4])
    d_lat = degrees_to_radians(defibrillator[5])
    x = calculate_x(d_long, d_lat)
    y = calculate_y(d_lat)
    defibrillators[defibrillator[1]] = distance(x, y)
  end

  def start
    Array.new(defibrilators_count) do
      defib = gets.chomp
      add_defibrillator(defib.split(';'))
    end
    defibrillators.min_by { |_, v| v }.first
  end
end

obj = Defibrillators.new
answer = obj.start
puts answer
