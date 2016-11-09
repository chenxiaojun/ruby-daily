pattern = Regexp.new("(.{10})(" + ARGV[0] + ")(.{10})")
p pattern
file = ARGV[1]
count = 0
line_number = 0

File.open(file) do |io|
  io.each_line do |line|
    if pattern =~ line
      line.scan(pattern) do |s|
        p "#{s[0]}<<#{s[1]}>>#{s[2]}"
        count += 1
      end
      line_number += 1
      #p line.gsub(pattern){|target| "<< "+target+" >>"}
    end
  end
end

puts "count is #{count}"
p line_number
