# File.rename('log2.txt', 'log.txt') #文件重命名

#如果想实现文件的复制， 文件的移动
#可以引用 fileutils这个库
# require 'fileutils'
# FileUtils.cp('log.txt', 'log2.txt')
# FileUtils.mv('log2.txt', 'garbige.txt')


#使用delete  unlink方法都可以删除文件
# File.delete('garbige.txt')


#获取当前文件所在的目录
# p Dir.pwd   #"/Users/Ricky/project/ruby-daily/base"
# p __dir__ #"/Users/Ricky/project/ruby-daily/base"
#获取当前的文件名
# p __FILE__ #"file_dir_one.rb"

#chdir  可以通过参数一  指定相对于当前目录的相对路径，也可以制定于相对于根目录的绝对路径
# Dir.chdir



#读取磁盘目录下的文件

# dir = Dir.open('/usr/local/var/www')
# while name = dir.read
#   p name
# end
#
# dir.close


#使用这种块去遍历的时候    不管是File还是Dir  都会在调用完close
# Dir.open('/usr/local') do |io|
#   io.each do |file|
#     p file
#   end
# end


#尝试读取文件夹 下   及其子文件夹下的所有文件
def traverse(path)
  if File.directory?(path)
    dir = Dir.open(path)
    while name = dir.read
      next if name == '.'
      next if name == '..'
      traverse(path + '/' +name)
    end
    dir.close
  end
  process_file(path)
end

def process_file(path)
  puts path
end


traverse('/usr/local/var/www')