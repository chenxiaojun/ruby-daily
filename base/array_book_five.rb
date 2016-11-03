a = [1, 2, 3]

b = a.collect do |i|
  i ** 2
end

c = a.map do |j|
  j += 20
end
puts b.inspect  #[1, 4, 9]
puts c.inspect  #[21, 22, 23]
#map 和  collect 都是将数组的元素  一个个传递到块里面处理  处理完 最后组成一个新的数组返回。  如果不加!，则不会影响原数组


#fill  将数组的某个元素或多个元素替换成某个值
c.fill('a')
puts c.inspect
puts c.fill('b', 1).inspect
puts c.fill('b', 1, 2).inspect


#flatten  将数组平坦化，就是数组里面的数组全部展开
d = ['a', ['b', 1], ['c', ['d', ['e'], 'f']]]
puts d.flatten.inspect

ex = (1..10).to_a
ex2 = ex.collect{|x| x * 100}
puts ex2.inspect
ex.map!{|x| x * 100}
puts ex.inspect

demo = (1..100).to_a

collect = demo.select do|i|
  i.modulo(3) == 0
end
puts collect.inspect

test = (1..100).to_a
test.reject!{|i| i.modulo(3) != 0}
puts test.inspect