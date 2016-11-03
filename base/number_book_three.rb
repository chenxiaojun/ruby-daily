#数组动态扩充
arr = []
arr << 1
arr << 'hello'
arr.push('test')
puts arr.inspect

#输出2次hello
2.times {p 'Hello'}


#from.upto(to){|i| ...}
#从from开始循环 对i每次进行+1处理。  直到i等于to  from比to大时不会执行循环处理
arr = []
3.upto(6) do |i|
  arr << i
end
puts arr.inspect


#from.downto(to)..  从from开始  每次-1   直到from比to小才不执行
arr2 = []
14.downto(9) do |j|
  arr2 << j
end
puts arr2.inspect


#从step开始， 每次+step  直到from不大于to停止
#from.step(to, step){...}
arr3 = []
3.step(16, 5){|i| arr3 << i}
puts arr3.inspect