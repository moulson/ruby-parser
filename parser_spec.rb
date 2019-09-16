require './parser.rb'

describe "parser" do
    it "Outputs an error if no parameters are supplied" do
        #Supply no parameter
        ARGV[0] = nil #rspec sets this arg so we set it back to nil for this test
        expect {Parser.main}.to output("Please provide the path to your log\n").to_stdout
    end

    it "Receives a log as an argument"

    it "returns a list of webpages with most page views ordered from most to least"

    it "returns a list of webpages with most *unique* page views ordered from most to least"

    it "returns an error if logfile is invalid" do
        ARGV[0] = "nonexistantpath.example"
        expect {Parser.main}.to output("File 'nonexistantpath.example' not found, please check the path is correct and try again\n").to_stdout
    end

    it "makes sure the file is not a directory" do
        ARGV[0] = './testdata'
        expect {Parser.main}.to output("./testdata is a directory, please enter a log file\n").to_stdout
    end

    it "makes sure the file is not empty" do
        ARGV[0] = './testdata/empty.log'
        expect{Parser.main}.to output("File is empty\n").to_stdout
    end
end
