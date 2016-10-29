#动态方法 可以控制静态方法，让静态方法的方法名和方法的内容会根据参数的变化而变化
def example_one(arg)
  puts "example one #{arg}"
end

def example_two(arg)
  puts "example two #{arg}"
end

def example_three(arg)
  puts "example three #{arg}"
end

loop do
  print "请输入: "
  num = gets.chomp
  if num =~ /one|two|three/   #["one", "two", "three"].include? num
    print "结果为: "
    send("example_#{num}", "haha")
  else
    print "输入有误\n"
    exit;
  end
end