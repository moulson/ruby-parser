class Parser

    def self.main
        path = ARGV[0]
        if path.nil?
            puts "Please provide the path to your log"
            return
        end
        if not File.exists? path
            puts "Error: File '#{path}' not found, please check the path is correct and try again"
            return
        end

    end

    main
end