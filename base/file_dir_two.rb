#创建目录
# Dir.mkdir('haha') unless Dir.exist?('haha')
#删除目录
# Dir.rmdir('haha')

st = File.stat('log.txt')
require 'etc'
pw = Etc.getpwuid(st.uid)
p pw
gr = Etc.getgrgid(st.gid)
p gr


#如果不指定第二个参数   返回a.txt  指定后 a
p File.basename('/usr/local/a.txt', '.txt')

#获取文件的扩展名
p File.extname('usr/local/a.txt')

#获取文件所在的目录
p File.dirname('/usr/local/a.txt')

#将文件的路径分成目录名   和   文件名两部分
#数组第一个元素对应目录  第二个元素对应文件名
p File.split('/usr/local/a.txt')

#连接两个参数   中间使用目录分隔符/
p File.join('/usr/bin', 'ruby')


#p $:

def print_libraries
  $:.each do |path|
    next unless FileTest.directory?(path)
    Dir.open(path) do |dir|
      dir.each do |name|
        if name =~ /\.rb$/i
          puts name
        end
      end
    end
  end
end

print_libraries