#判断字符串长度可以使用empty?方法
str = ''
puts str.size  #0

str = 'haha'
puts str.length #4

str = ''
p str.empty? #true


#像数组一样通过  索引获得字符串中某个位置的元素
str = 'happy'
puts str[4]


#字符串之间用 + 创建一个新的字符串       用 << 扩展某个字符串
new_str = str + ' birthday!'
new_str << 'Ricky'

puts new_str


#字符串的分割  使用split方法    字符串按某个字符分割成数组
str = '程序员,A,今天,挨骂,了'
column = str.split(',')   #["程序员", "A", "今天", "挨骂", "了"]
puts column.inspect

str = %q{135 136 137 138}
puts str.split(/\s+/).inspect #使用正则匹配到内容 进行划分
puts str.split(' ').inspect #可以给定参数指定过滤条件
puts str.split(/ /).inspect #可以给定参数指定过滤条件
puts str.split.inspect   #其实split不给参数  默认就是按空格划分

puts 'haha'.split(//).inspect #这种匹配会将字符一个一个拆分

puts 'I am Ricky I love Ruby'.split(/ /, 3).inspect  #第三个参数拆分的数组长度  先按第一个拆分，直到长度为第三个参数-1 剩余部分作为一个元素


#删除字符串末尾的换行符
print "abc\n"
print "abc\n".chomp#会删除末尾最后一个换行符
print "abc\n".chop#会删除末尾最后一个字符
print "abc".chop
puts ''


#查询某个字符串中是否有某个字符
#index 会从左向右检查，如果有则返回存在的下标      rindex会从右向左检查 返回下标
str = 'laikanwo aaa'

puts str.index('wo')   #6
puts str.slice(6, 2)


str = 'laikanwo aaa'
puts str.rindex('wo')

puts str.index('a')
puts str.index('h').nil?


#如果只是想单纯的检查字符串里面是否有某个字符串  可以使用include?
puts "hahahah".include?('ha')
