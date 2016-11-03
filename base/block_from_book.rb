['a', 'b', 'c'].each{|val| p val}
3.times{ p 'haha'}

['d', 'f'].each_with_index{|val, key| p "#{key} with #{val}"}

{name:'ricky', age:21}.each_with_index do |key, val|
  p "#{key} *** #{val}"
end

{kind:'cat', color:'red'}.each{|x| p x.inspect}


file = File.open('./read_file.txt')
file.each_line {|line| p line}

# => 相当于

File.open('read_file.txt') do |file|  #确保程序处理完一定会执行
    file.each_line do |line|
      puts line
    end
end

# => 更好的处理
file = File.open('read_file.txt')
begin
  file.each_line do |line|
    puts line
  end
ensure
  file.close
end