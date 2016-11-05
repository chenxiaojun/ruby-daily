#正则表达式
#如果程序中定义了字符串对象str，且希望这个字符串创建正则表达式    使用new的形式会比较好
re = Regexp.new('ruby')
p 'I like ruby' =~ re   #如果匹配到了 那么返回匹配到的位置   匹配不到返回nil

#最简单的创建正则的方式是使用//
re = /我\s+们/
p '我    们' !~ re #false


#如果正则里面含有 /  使用%r会更好
re = %r{w/.*}
p 'sdfsdfw/我们' =~ re  #6


#匹配行首  和  行尾
re = /^(a2b|bc).+yy$/
p 'bcddyy' =~ re


#匹配字符串的开头 或 结尾
p 'I like ruby' =~ /\A/    #\A匹配字符串的开头
p 'I like ruby' =~ /\z/    #\z匹配字符串的结尾   \Z -> 如果字符串结尾有换行符，那么匹配换行符前面的一个字符


#限定长度
p 'haha' =~ /^ha../ #0
p 'haha' =~ /^ha.../ #nil
p 'haha' =~ /^ha.{3}/ #nil
p 'ha13  sdf    sf' =~ /\d+\s*\w+\s*sf/


#贪婪匹配 惰性匹配    最长匹配 最短匹配
p 'hasdfsdlfhsdofhsdklfjha' =~ /(h.*a)+/  #会匹配到整个字符串
p 'hasdfsdlfhsdofhsdklfjha' =~ /h.*?a/ #只会匹配到第一个ha就结束




