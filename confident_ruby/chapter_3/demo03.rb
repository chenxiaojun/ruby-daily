require 'pathname'

test_file = Pathname('~/test.txt').expand_path

File.open(test_file).each_line{ |l| puts l }