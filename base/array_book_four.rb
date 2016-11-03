a = ['a', nil, 1, nil, 'he']

#如果想去掉数组中nil的元素  使用compact
b = a.compact
puts b.inspect

c = [1, 3, 4, 1, 2]
c.delete(1)   #delete方法可以指定数组中某个元素进行删除
puts c.inspect


e = ['a', 'c', 'd']
e.delete_at(1)  #针对某个下标进行删除
puts e.inspect



#delete_if{|i| ..} 会真的从数组里面删除   reject不会真的删除  会返回删除的东西回去
f = [1, 2, 3, 4, 5]
#puts f.reject{|item| item > 4}
f.delete_if{|i| i > 3}
puts f.inspect


#slice  删除数组中指定的部分  并返回删除的值
g = [1, 2, 3, 4]
g.slice!(0, 2)
puts g.inspect