#字符串和数组   有很多  共通的方法
str = "I am Ricky, I love Ruby!"

puts str.slice(2, 4)

puts str.length

puts str[3..6]

puts "欢迎".concat('光临')

puts "哈哈呵呵".delete("呵")

puts "白白拜拜".reverse



#删除字符串首尾空格   strip
puts "    哈哈      呵呵    ".strip

#字母转大写
puts "ricky".upcase

#字母转小写
puts "RICKY".downcase


#大变小  小变大
puts "Ricky".swapcase


#开头字母大写
puts "ricky".capitalize

#tr  可以用于置换字符  把字符串中指定的字符换成想要的
puts "Ruby是世界上最好的语言".tr('Ruby', ' PHP')


#可以encode指定字符编码
#   #encoding: UTF8
puts "陈校军".encode('utf-8')
puts "陈校军".encode('gbk')

str = 'Ruby is an object oriented programming language'
str_new = str.split
puts str_new.inspect

str_new = str_new.sort
puts str_new.inspect

str_new = str_new.sort_by { |s| s.downcase}
puts str_new.inspect

str = 'Ruby is an object oriented programming language'
new_arr=""
str.split.collect{|s| s.capitalize}.each{|x| new_arr << x+' '}
puts new_arr


str = 'Ruby is an object oriented programming language'
count = Hash.new(0)
puts count.inspect
str.each_char do |c|
  count[c] += 1  
end

count.keys.sort.each do |char|
  puts sprintf("'%s' : %s\n", char, "*" * count[char]) if char != ' '
end