module ActAsCsv
    def self.included(base)
        base.extend ClassMethods
    end

    module ClassMethods
        def acts_as_csv
            include InstanceMethods
        end
    end

    module InstanceMethods
        def read
            @csv_contents = []
            filename = self.class.to_s.downcase + '.txt'
            file = File.new(filename)
            @headers = file.gets.chomp.split(', ')

            file.each do |row|
                @csv_contents << row.chomp.split(', ')
            end
        end

        attr_accessor :headers, :csv_contents
        def initialize
            read
        end

        def each
            csv_contents.each{|row| yield CsvRow.new(row, headers)}
        end
    end
end

class RubyCsv
    include ActAsCsv
    acts_as_csv
end

class CsvRow
    attr_accessor :headers, :row
    def initialize(row, headers)
        @row = row
        @headers = headers
    end

    def method_missing name, *args
        index = headers.index name.to_s
        if index 
            return row[index]
        else
            super
        end
    end
end

m = RubyCsv.new
# puts m.headers.inspect
# puts m.csv_contents.inspect
m.each{|row| puts row.one}