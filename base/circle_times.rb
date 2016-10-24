#循环语句

#只是单纯执行一定次数的处理
count = 1
4.times do
  print '第', count, '次', "\n"
  count += 1
end

num = 1
3.times{
  print '第', num, '次', "\n"
  num += 1
}

5.times do |i|
  puts "第#{i+1}次"
end

2.times{
  |i| puts "第#{i+1}次"
}