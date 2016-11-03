name = []
name << 'a'
name[1] = 'haha'
name.push('hehe')
p name[2]
puts name.inspect
name.each{|val| p "#{val}"}
name.each_with_index{|val, index| p "#{index} is #{val}"}



#创建数组的方式
arr = Array.new
arr1 = Array.new(3)
arr2 = Array.new(4){|i| i ** 2}
puts arr.inspect
puts arr1.inspect
puts arr2.inspect


#创建不包含空白的字符串数组
languages = %w(PHP Ruby Python C C++ JAVA Golang Swift)
puts languages.inspect

#与之相对应  创建symbol的方法
langs = %i(Chinese English Japanese)
puts langs.inspect

#散列 转换为  数组
h_change = {name:'ricky', age:23}.to_a
puts h_change.inspect

#字符串转化为 数组
#对以空格   或   逗号 隔开的字符串   可以直接调用split分割成数组
s_change = "a b c d".split
puts s_change.inspect


#获取数组的方式新增     a[1..2]  返回a[1] a[2]重新组成的数组
a = ['h', 'i', 'k', 'z']
puts a[1..2].inspect  #['i', 'k']  取出1..2之间的元素
puts a[2, 5].inspect  #从下标为2的地方  开始向后取2个
puts a.at(3) #'z'
puts a.slice(1,3).inspect
puts a.slice(2)
puts a.slice(1..3).inspect
a[2, 3] = ['hah', 'heh', 'hei']#✅对下标为2的后面 插入3个值
puts a.inspect

#在某个位置插入新值  如果指定的第二个参数为0  表示在第某个元素后面开始插入 待插入的值
a[3, 0] = ['aa', 'bb', 'cc', 'dd']
puts a.inspect

#上面可以连续获取数组一组元素    如果想分散获取数组一些元素
puts a.values_at(1, 3, 5, 2).inspect