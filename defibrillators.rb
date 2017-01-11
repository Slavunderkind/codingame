# Solution for https://www.codingame.com/ide/puzzle/defibrillators

class Defibrillators
  attr_accessor :lon, :lat, :n

  def initialize
    @lon = parse(gets.chomp)
    @lat = parse(gets.chomp)
    @n = gets.to_i
  end

  def calculate_x(d_long, d_lat)
      c = Math.cos((lat + d_lat) / 2)
      (d_long - lon) * c
  end

  def calculate_y(d_lat)
      d_lat - lat
  end

  def destination(x, y)
     Math.sqrt(x*x + y*y) * 6371
  end

  def parse(var)
      (var.sub(',', '.').to_f * Math::PI) / 180
  end

  def find_closest(defibrilators_hash)
      min = defibrilators_hash.values.first
      closest_name = defibrilators_hash.keys.first

      defibrilators_hash.map do |key, value|
         if value < min
            min = value
            closest_name = key
         end
      end
      closest_name
  end

  def start
    defibri = Hash.new

    n.times do
        defib = gets.chomp
        defib_array = defib.split(';')

        d_long = parse defib_array[4]
        d_lat = parse defib_array[5]
        x = calculate_x(d_long, d_lat)
        y = calculate_y(d_lat)
        distance = destination(x, y)

        defibri[defib_array[1]] = distance
    end
    puts find_closest(defibri)
  end
end

obj = Defibrillators.new
obj.start
