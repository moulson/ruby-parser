class Parser

    def self.main

        path = ARGV[0]

        if path.nil?
            puts "Please provide the path to your log"
            return
        end

        if not File.exists? path
            puts "File '#{path}' not found, please check the path is correct and try again"
            return
        end

        if File.directory? path
            puts "#{path} is a directory, please enter a log file"
            return
        end

        #pre-file validations finished, open the file
        file = File.open(path, "r") #open the log for reading
        if file.each_line.count == 0
            puts "File is empty"
            return
        end
        file.each_line do |line|
            
        end

    end

    main

end