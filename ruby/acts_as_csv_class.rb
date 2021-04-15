module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
    puts "I was included :)"
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    class CsvRow
      def method_missing(name, *args)
        column_name = name.to_s
        @row[column_name]
      end

      def initialize(columns=[], values=[])
        @row   = {}

        if columns.length < 1
          raise "No columns given."
        end

        if values.length < 1
          raise "No values given."
        end

        columns.each_with_index do | column_name, index |
          @row[column_name] = values[index]
        end
      end
    end

    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ' )

      file.each do |row|
        @csv_contents << row.chomp.split(', ' )
      end
    end

    attr_accessor :headers, :csv_contents
    def initialize
      read
    end

    def each
      @csv_contents.each do |line|
        yield(CsvRow.new(@headers, line))
      end
    end
  end
end

class RubyCsv # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each do |csv_row|
  puts csv_row.Column1
end