#我们尝试去掉下载的文件里面的html标签
require 'cgi/util'

download_html = 'cathedral.html'  #我们下载的文件
target_txt = 'cathedral.txt' #我们将要写入的文件

target = File.open(target_txt, 'w')

File.open(download_html) do |io|
  flag = true
  io.each do |line|
    if flag && line !~ /<a name="1">/
      #说明是头部分
      next
    end
    #说明到了中间部分
    flag = false
    #如果到了尾巴  那么直接跳出即可
    break if /<a name="version">/ =~ line

    #对line  去除html标记
    line.gsub!(/<[^>]+>/, '')
    new_line = CGI.unescape_html(line)  #将html一些元字符转义过来
    #将中间的部分写入新的文件
    target.write(new_line)
  end
end