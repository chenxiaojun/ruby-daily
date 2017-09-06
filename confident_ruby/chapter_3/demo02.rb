class TestFile
  def initialize
    @filename = "#{ENV['HOME']}/test.txt"
  end

  def to_path
    @filename
  end
end

test_file = TestFile.new
puts test_file
File.open(test_file).each_line{ |l| puts l }