require './parser.rb'

describe 'parser' do
    context 'frequency and sorting' do
        it 'returns a list of webpages with most page views and then most *unique* page views ordered from most to least' do
            ARGV[0] = './testdata/weblog.log'
            expect {Parser.main}.to output("/home/1 3 visits\n/edit 2 visits\n/home/1 2 unique visits\n/edit 1 unique visits\n").to_stdout
        end

        it 'should show same values for both if all values are unique' do
            ARGV[0] = './testdata/allunique.log'
            expect {Parser.main}.to output("/home/1 10 visits\n/edit 8 visits\n/home/1 10 unique visits\n/edit 8 unique visits\n").to_stdout
        end

        it 'should ignore empty lines' do
            ARGV[0] = './testdata/empty_lines.log'
            expect {Parser.main}.to output("/home/1 10 visits\n/edit 8 visits\n/home/1 10 unique visits\n/edit 8 unique visits\n").to_stdout
        end

        it 'should ignore lines that don\'t fit the format' do
            ARGV[0] = './testdata/bad_format.log'
            expect {Parser.main}.to output("/home/1 10 visits\n/edit 8 visits\n/home/1 10 unique visits\n/edit 8 unique visits\n").to_stdout
        end
    end

    context 'file validation' do
        it 'returns an error if logfile is invalid' do
            ARGV[0] = "nonexistantpath.example"
            expect {Parser.main}.to output("File 'nonexistantpath.example' not found, please check the path is correct and try again\n").to_stdout
        end
    
        it 'makes sure the file is not a directory' do
            ARGV[0] = './testdata'
            expect {Parser.main}.to output("./testdata is a directory, please enter a log file\n").to_stdout
        end
    
        it 'makes sure the file is not empty' do
            ARGV[0] = './testdata/empty.log'
            expect {Parser.main}.to output("File is empty\n").to_stdout
        end
    end

    context 'program start' do
        it 'Outputs an error if no parameters are supplied' do
            #Supply no parameter
            ARGV[0] = nil #rspec sets this arg so we set it back to nil for this test
            expect {Parser.main}.to output("Please provide the path to your log\n").to_stdout
        end
    end

    context 'regex testing' do
        it 'accepts the format "/path/to/route 192.168.0.1"' do
            line = "/path/to/route 192.168.0.1"
            expect(Parser.valid_line? line).to eq(true)
        end

        it 'requires a / at the start of the string' do
            line = "path/to/route 192.168.0.1"
            expect(Parser.valid_line? line).to eq(false)
        end

        it 'requires the IP to be a combination of numbers and dots' do
            line = "/path/to/route abc"
            expect(Parser.valid_line? line).to eq(false)
        end

        it 'accepts the format of the main file' do
            line = '/about/2 235.313.352.950'
            expect(Parser.valid_line? line).to eq(true)
        end

        it 'rejects an empty line' do
            line = ''
            expect(Parser.valid_line? line).to eq(false)
        end

        it 'rejects if the values are not space separated' do
            line = '/about/2235.123.233'
            expect(Parser.valid_line? line).to eq(false)
        end
    end
end
