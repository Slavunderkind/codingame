# frozen_string_literal: true

class GroupByOwners
  def execute(files)
    files.each_with_object({}) do |(key, value), result|
      result[value] ||= []
      result[value] << key
    end
  end

  files = {
    'Input.txt' => 'Randy',
    'Code.py' => 'Stan',
    'Output.txt' => 'Randy'
  }
  obj = GroupByOwners.new
  puts obj.execute(files)
end
