# i = 1
# while line = STDIN.gets
#   p 'come in'
#   line.chomp!
#   break if i > 4
#   i += 1
# end
#
# p $stdin.eof?

# p gets

# STDIN.each_line do |line|
#   line.chomp!
#   p line
# end

# p $stdin.getc


#puts 方法    在字符串末尾添加换行符输出
#            指定多个参数，会分别添加换行符
#            如果参数是String类之外的对象    会先调用to_s 然后shuchu
# puts 'hello'
# puts 'ricky'
# puts ['bei', 'jing']
#
# $stdout.write('Hello')
#
# p '-----***----'
# File.open('log.txt') do |io|
#   p io.read(6)
#   p io.pos
#   p io.gets
#   p $stdin.tty?
#   io.pos = 0
#   p io.gets
# end


#io.binmode  将内容转换为二进制
File.open('log.txt', 'w+') do |io|
  io.binmode
  io.write "Hello World.\n"
end