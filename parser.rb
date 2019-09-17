require './pageview.rb'
require 'facets'

class Parser

    def self.main

        path = ARGV[0]

        if path.nil?
            puts "Please provide the path to your log"
            return
        end

        if not valid_file? path
            return
        end

        file = File.open(path, "r") #open the log for reading

        arr = []
        #create a dictionary of the log
        file.each_line do |line|
            if valid_line?(line)
                data = line.split(' ')
                view = PageView.new
                view.route = data[0]
                view.ip = data[1]
                arr.push(view)
            end
        end

        #List pages by viewcount, regardless of individuality
        route_arr = []
        arr.each do |pv|
            route_arr.push pv.route
        end
        order_by_frequency(route_arr, "visits")

        #List pages by unique viewcount
        route_arr = []
        arr.uniq{|x|[x.route, x.ip]}.each do |pv|
            route_arr.push pv.route
        end
        order_by_frequency(route_arr, "unique visits")
    end

    def self.valid_file?(path)
        if not File.exists? path
            puts "File '#{path}' not found, please check the path is correct and try again"
            return false
        end

        if File.directory? path
            puts "#{path} is a directory, please enter a log file"
            return false
        end

        if File.zero? path
            puts "File is empty"
            return false
        end
        return true
    end

    def self.order_by_frequency(array, context)
        #Order given array by frequency and sort in descending order
        array.frequency.sort_by{|x| -x[1]}.each do |el|
            puts "#{el[0]} #{el[1]} #{context}"
        end
    end

    def self.valid_line?(line)
        return !(line =~ /^\/[a-zA-Z\/0-9_]*\s[\d\.]*[\s\\n]*\z/).nil?
    end
end

Parser.main