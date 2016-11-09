#对我们下载好的资源进行处理
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

    #将中间的部分写入新的文件
    target.write(line)
  end
end