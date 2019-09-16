require './parser.rb'

describe "parser" do
    it "Outputs an error if no parameters are supplied" do
        parser = Parser.new
        #Supply no parameters
        expect {parser.main}.to output("Please provide the path to your log")
    end

    it "Receives a log as an argument"

    it "returns a list of webpages with most page views ordered from most to least"

    it "returns a list of webpages with most *unique* page views ordered from most to least"

    it "ignores other arguments"

    it "returns an error if logfile is invalid" do
        parser = Parser.new
        ARGV[0] = "nonexistantpath.example"
        expect {parser.main}.to output("Error: File 'nonexistantpath.example' not found, please check the path is correct and try again").to_stdout
    end
end
