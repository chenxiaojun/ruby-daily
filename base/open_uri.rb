#通过require引用open-uri库后， 我们就可以像打开普通文件一样打开HTTP， FTP的url   使用open方法打开
# require 'open-uri'
#
# resource = open('http://www.baidu.com')
# p resource  ##<Tempfile:/var/folders/cr/5fq57rgn2jd9vjgw629692380000gn/T/open-uri20161106-2745-gdmo8s>
#
#
#
# #我们可以给定第二个参数
# options ={
#     "User-Agent" => "Ruby/#{RUBY_VERSION}",
#     "From" => "rickycxj@gmail.com"
# }
# open('http://www.baidu.com', options) do |io|
#   #p io.read  #将百度官方网页输出到控制台
#   io.each_line{|line| p line}
# end



#IO.popen方法会生成IO对象的输入与输出  它会关联shell command
#也就是说 IO对象的输入输出会作为命令输出给 shell去执行，   然后返回shell执行的结果作为IO对象的输入
# IO.popen('ls -l').each_line do |line|
#   p line
# end



#缓冲  即使对IO对象输出数据，结果也不一定马上就会反映在控制台或者文件中
      #在使用write，print方法操作IO对象，程序内部会开出一个空间保存临时数据，这部分空间就叫缓冲。 等缓冲到一定数据，再一起输出出来
#标准错误不会存放缓冲

$stdout.print "A\n"
$stdout.print "A\n"
$stdout.flush
$stdout.print "B\n"
$stdout.print "B\n"
$stderr.print "C\n"
$stderr.print "C\n"
$stdout.print "D\n"
$stdout.print "D\n"
