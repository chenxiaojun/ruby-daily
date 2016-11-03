#1 新的hash语法
hh = Hash[:key, 'val']
puts hh
#常规创建
hh1 = { key:'val' }
hh2 = {:key=>'val'}
p hh1
p hh2

p hh[:key]
p hh1[:key]
p hh2[:key]

#2老的hash语法
ht = Hash['key', 'val']
ht2 = {'key' => 'val'}
p ht
p ht2
p ht2['key']
p '---------***-----------'

#3 Lambda
ll = ->(arg){ arg ** 2}
p ll.call(4)

ll2 = lambda{|i| i .modulo(3)}
p ll2.call(5)
p '----------***------------'

#4 双星是Ruby的一个小魔法
# def my_method(a, *b, **c)
# end
# a将接受传给my_method的第一个参数， b将接收传给my_method除了a以为的所有参数，**c将会将收所有类似key:val的参数
def my_method(a, *b, **c, &block)
  puts a
  puts b.inspect
  puts c.inspect
  puts b.at(3).call(5)
  puts yield(15)
  puts block.call(25)
end

#my_method('Hello')   #Hello
#my_method('Hello', 'Ricky', 'Ni', 'Hao')   #Hello  ["Ricky", "Ni", "Hao"]
#my_method('Hello', 'Ricky', 'Ni', 'Hao', age:20, hobby:'computer') #Hello ["Ricky", "Ni", "Hao"] {:age=>20, :hobby=>"computer"}
pro = proc{ |i| i+2 }
my_method('Hello', 'Ricky', 'Ni', 'Hao', pro, age:20, hobby:'computer'){|j| j.div(5)}
p '------------***----------------'

#5 操作单个对象和数组用同样的方式
#有时候我们事先不知道给定的是什么类型的对象，可以通过下面的方式先去接收
#其实就是强制类型转换为数组 然后使用数组的方法
obj = 1
obj_arr = [1, 2, 3]
obj_hash = {name:'ricky'}
[*obj].each{|s| puts s}
Array(obj).each{|s| puts s}
Array(obj_hash).each{|s| puts s}
[*obj_arr].each{|s| puts s}
p '------------***---------------'

#6 ||= 操作符号
#用于初始化变量
#a ||= b      =>    a = a || b  如果a是nil或false 就a=a   如果不是 就a=b
a = 6
b = 9
a ||= b
c ||= b
puts a
puts c


#强制方法接收一个hash对象  并把需要键事先就固定下来了。
def my_func(a:, b: 'default')
  puts a
end

# my_func(1) #in `my_func': wrong number of arguments (given 1, expected 0)
my_func(a:'ricky')  #Ricky
p '---------------***---------------'


#tap是一个很好的小方法  去  提高代码的可读性
class User
  attr_accessor :a, :b, :c

  def inspect
    "#{a} #{b} #{c}"
  end
end

#tap 方法可以将 被调用的对象传递到块中， 最后再返回这个对象
def local_method(x, y, z)
  # u = User.new    #这么写很难看
  # u.a = x
  # u.b = y
  # u.c = z
  # u
  User.new.tap do |u|
    u.a = x
    u.b = y
    u.c = z
  end
end

p local_method(2, 5, 7)
p '--------***---------'

#heredoc 文档
puts <<-HERE.gsub(/^\s+/, '')   #去掉前面的空格
  I am
Ricky, Who are you?
HERE
p '--------***---------'

test = ->(x, y){ x + y}
puts test.(4, 6)


