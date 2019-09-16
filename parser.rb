class Parser
    
    main

    def main
        path = ARGV[0]
        if not File.exists? path
            print "Error: File '#{path}' not found, please check the path is correct and try again"
        end
    end
end