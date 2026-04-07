require 'csv'

class FileParser
  def self.call(file)
    CSV.foreach(file.path, col_sep: "\t", headers: true) do |row|
      yield row
    end
  end
end
