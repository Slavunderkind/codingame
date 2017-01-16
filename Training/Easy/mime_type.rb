# Solution for https://www.codingame.com/ide/puzzle/mime-type
class MimeType
  attr_accessor :n, :q, :associations

  def initialize
    @n = gets.to_i # Number of elements which make up the association table.
    @q = gets.to_i # Number Q of file names to be analyzed.
    @associations = init_associations
  end

  def init_associations
    associations = {}
    n.times do
      ext, mt = gets.split(' ') # ext: file extension, mt: MIME type.
      associations[ext.downcase] = mt
    end
    associations
  end

  def start
    q.times do
      fname = gets.chomp # One file name per line.
      splitted_fname = fname.split('.')
      result = nil
      if splitted_fname.size > 1 && fname[-1] != '.'
        result = associations.fetch(splitted_fname.last.downcase, 'UNKNOWN')
      end
      result = 'UNKNOWN' if result.nil?
      puts result
    end
  end
end

obj = MimeType.new
obj.start
