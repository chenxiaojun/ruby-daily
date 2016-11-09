require 'open-uri'

url = 'http://cruel.org/freeware/cathedral.html'
filename = 'cathedral.html'


#下载一个资源
File.open(filename, 'w').write(open(url).read)


