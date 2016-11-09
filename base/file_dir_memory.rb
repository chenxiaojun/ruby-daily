#创建一个文件

#---- memory 1 -------
#file.new  和  file.open都是用来打开文件的
#file = File.new('log.txt', 'r')
#关于文件的模式， r->只读   w->只写  a->追加只写
#r+ -> Read-write mode, The file will be at the beginning of the file
#w+ -> Read-write mode, Overwrites the existing file if the file exists. if the file does not exist,creates a new file
#a+ -> Read and write mode, The file is at the end of the file if the file exists. The file opens in the append mode.
      #if the file does not exists, it creates a new file for reading and writing.

#readlines会一次把所有内容读取到数组里面
# lines = file.readlines
# file.close
#
# file2 = File.open('test.log', 'w+')
# file2.write(lines.join)
# file2.rewind
# p file2.read(5)

#----memory 2---------
File.delete('test.log') if File.exist?('test.log')  #删除一个文件

#将log.txt里面的内容反过来写到另一个文件中
File.open('debug.txt') do |io|
  #each each_line一次读取一行    gets也是一次读取一行，读不到返回false，一般配合while使用
  while(line = io.gets)
    #p line  #这里面我们就可以对这个行进行处理了
    #p line.gsub(/\s+/, '') #去掉空格 换行符 制表符
    #p line.chomp #去掉末尾空格
    p line.gsub(/\s+/, '').upcase.downcase.capitalize.swapcase #每一行字母先大写然后小写再首字母大写最后反向
  end

  #上面是一次读取一行的方式处理     下面是一次全部读取到数组里面,然后对数组就行遍历
  # io.each_line do |line|
  #   p line
  # end

  # io.each_line do |line|
  #   p line
  # end
end

#文件重命名 参数一->老的文件名   参数二->旧的文件名
File.rename('log.txt', 'debug.txt') if File.exist?('log.txt')

#更改文件的权限
f = File.open('debug.txt', 'w')
f.chmod(0755)
p f.atime
#p f.stat


#判断目录是否存在
p File::directory?('debug.txt') #false
p File::directory?('/usr/bin')  #true
p File::ctime('debug.txt')  #查看文件的创建时间
p File::atime('debug.txt')  #查看文件的最后访问时间
p File::mtime('debug.txt')  #查看文件最后修改的时间


p Dir.pwd
p __dir__ + '/' + __FILE__
#Dir.entries   可以取得某一个特定文件夹下面的  所有文件
p Dir.entries("/usr/local/var/www").reject{|file| file =~ /^(\.)+/}.join(' ')
#Dir foreach提供了相同的功能
p Dir.foreach("/usr/local/var/www").reject{|file| file =~ /^(\.)+/}.join(' ')
p Dir["/usr/local/var/www/*"]

#File.join 连接字的时候  默认会在参数之间加上 /
p File.join(__dir__, __FILE__)


def travel(resource)
  #判断目录名是否存在  存在才会去遍历里面的 不存在就直接输出名字
  if File.directory?(resource)
    dir = Dir.open(resource)
    while(name = dir.read)
      next if name == '.' || name == '..'
      travel(File.join(resource, name))
    end
  end
  p resource
end

travel('/usr/local/var/www')








