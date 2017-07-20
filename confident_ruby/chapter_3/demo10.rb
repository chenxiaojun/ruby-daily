def test(number)
  case number
  when 42
    puts "the ultimate answer"
  when ->(x) { (x % 2) == 0 }  # Ruby中case语句用的是三等运算符，而刚好Ruby的Proc对象定义了三等运算符相当于call
    puts 'even'
  else
    puts 'odd'
  end
end

test 31