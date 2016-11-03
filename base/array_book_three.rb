#队列 先进先出 ruby对应的   数组末尾push一个元素   在数组开头shift一个元素
#栈   后进先出  ruby对应的  数组的末尾push进去一个  在数组的末尾pop出一个
arr = ['c', 'd']

arr.push('e')
puts arr.inspect
arr.shift     #shift 删除数组开头元素  返回值是哪个被删除的元素
puts arr.inspect


arr.push('f')
puts arr.inspect
arr.pop       #删除数组末尾元素  返回值是被删除的那个元素
puts arr.inspect


#在数组的开头  追加  一个元素     unshift
arr.unshift('a')
puts arr.inspect


puts arr.first



# <<  与 push 是等价的   在数组的末尾追加元素。
arr << 'Hello'
puts arr.inspect


# a.concat(b)  #连接数组a 和 数组b

# concat  和  +   都可以把两个数组合并一起，不会去重。  但是concat会破坏原有的结构
a = ['a', 'b']
b = ['b', 'c']
puts (a+b).inspect
puts (a.concat(b).inspect)
puts a.inspect
