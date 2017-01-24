# Solution for https://www.codingame.com/ide/puzzle/mime-type
class MimeType
  attr_reader :elements_count, :files_count, :associations

  def initialize(elements_count, files_count)
    @elements_count = elements_count
    @files_count = files_count
    @associations = init_associations
  end

  def init_associations
    associations = {}
    elements_count.times do
      ext, mt = gets.split(' ') # ext: file extension, mt: MIME type.
      associations[ext.downcase] = mt
    end
    associations
  end

  def match_file(filename)
    unknown = 'UNKNOWN'
    name_and_extension = filename.split('.')
    if name_and_extension.size > 1 && filename[-1] != '.'
      result = associations[name_and_extension.last.downcase]
    end
    result ||= unknown
  end

  def start
    files_count.times do
      filename = gets.chomp # One file name per line.
      puts match_file(filename)
    end
  end
end

elements_count = gets.to_i
files_count = gets.to_i
obj = MimeType.new(elements_count, files_count)
obj.start
