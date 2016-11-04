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




