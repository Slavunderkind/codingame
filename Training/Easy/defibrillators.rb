# Solution for https://www.codingame.com/ide/puzzle/defibrillators
class Defibrillators
  attr_accessor :lon, :lat, :n, :defibrillators

  def initialize
    @lon = parse(gets.chomp)
    @lat = parse(gets.chomp)
    @n = gets.to_i
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

  def parse(var)
    (var.sub(',', '.').to_f * Math::PI) / 180
  end

  def find_closest(defibrillators_hash)
    min = defibrillators_hash.values.first
    closest_name = defibrillators_hash.keys.first

    defibrillators_hash.map do |key, value|
      if value < min
        min = value
        closest_name = key
      end
    end
    closest_name
  end

  def init_defibrillators(defibrillator)
    d_long = parse(defibrillator[4])
    d_lat = parse(defibrillator[5])
    x = calculate_x(d_long, d_lat)
    y = calculate_y(d_lat)
    defibrillators[defibrillator[1]] = distance(x, y)
  end

  def start
    n.times do
      defib = gets.chomp
      init_defibrillators(defib.split(';'))
    end
    puts find_closest(defibrillators)
  end
end

obj = Defibrillators.new
obj.start
