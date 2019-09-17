# Ruby Parser

##### built using ruby version 2.6.3

##### usage: `ruby parser.rb <path_to_logfile>`
parses log files in the format `<route> <ip>\n`
and prints the routes out in order of frequency from highest to lowest

First it prints out regardless of uniqueness then it will print out frequency of unique page hits

This parser uses **rspec** for testing and **facets** for sorting

if using rvm on Mac OS, run `rvm use ruby-2.6.3` to make sure you are using the correct version of Ruby for this program

run `bundle install` once in the directory to install these gems

run `rspec .` inside the program directory to run the tests