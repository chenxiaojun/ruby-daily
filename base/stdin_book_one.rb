#IO类
#IO类的作用是 让程序与外部进行数据的输入/输出操作

#程序在启动后会预先分配3个IO对象

#1 标准输入  可以获取键盘输入的内容。 通过预定义常量STDIN或全局变量$stdin 可以操作标准IO对象   不指定接收者的gets方法会默认获取标准输入的内容
#2 标准输出  向标准输出写入内容输出到屏幕上 通过STDOUT或$stdout， 可以操作IO对象   不指定对象可以使用puts print printf默认输出
#3 标准错误输出   通过STDERR 或$stderr操作IO对象

$stdout.print "Output to $stdout.\n"
STDOUT.print "haha\n"
$stderr.print "Output to $stderr.\n"

#值得注意的是  如果我们通过ruby 文件名.rb  > 文件名.log  可以在执行文件名.rb的时候  将标准输出的结果写入到文件名.log中
#而标准错误输出的则会被输出到屏幕上



#检查程序是否是标准输入的例子   (有时候我们要判断访问此文件是命令行  还是   浏览器)
if $stdin.tty?
  puts '来自于tty'
else
  puts '来自于others0'
end


#File类是IO类的子类
#通过File.open 或  open   获取新的IO对象
# io = File.open('log.txt')

#open方法接收两个参数   第一个参数是文件名，  第二个参数是读写模式 r r+ w w+ a a+
io = open('log.txt')
p io

#io.close方法   用于关闭文件    File.open如果使用块  则文件会在使用完之后自动关闭   .close?检查是否已关闭    File.read可以一次性读取内容
File.read('log.txt').chomp.each_line{|l| p l}