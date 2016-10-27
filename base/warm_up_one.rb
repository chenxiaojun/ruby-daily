def f1
  yield
end
f1{ p "Hello, Ricky" } #Hello, Ricky

def f2(&block)
  block.call
end
f2{ p 'Hi, Mary' } #Hi, Mary

def f3(block)
  block.call
end

f3(lambda{ p 'Hi, Tom' }) #Hi, Tom

f3(->{ p 'Hi, Lili' }) #Hi, Lili


block = ->(x, y){ x+y }
p block.call(5, 8)


#block是方法一个重要但非必要的组成部分
def example_one(arg1, arg2, &block) #这里block不会对方法有任何影响，可传可不传
  [nil]
end
p example_one(1, 2)
# &block不是一个参数，而是一种声明。 如果传入了，那么方法会将其保存到block中，不传什么都不干。


#如果方法里有yield  或者  block.call时，  必须有对应对块，否则抛出异常
def example_two
  #yield  ## no block given (yield) (LocalJumpError)
  yield if block_given?
end
example_two

def example_three(&block)
  #block.call # undefined method `call' for nil:NilClass
  block.call if block_given?
end
example_three

def example_four(&block)
  p block.class #nil
  p block.inspect #Proc
  block.call #<Proc:0x007fda6a0cf958@warm_up_one.rb:50>
end
example_four{}

#---------------------***---------------------
p [1, 2] & [2, 3]   #取交集  [2]
p [1, 2] | [2, 3]   #取并集  [1, 2, 3]
#---------------------***---------------------
# ['1', '2', '3'].map{ |i| i.to_i }

#符号 & 会触发 :to_i 的to_proc方法， to_proc执行后会返回一个proc实例
#然后 & 会把这个proc实例转换成一个block, 因为map方法后挂载的是一个block
#而不是接收一个proc对象做参数。   &:to_i是一个block  :to_i是Symbol类的实例
p ['1', '2', '3'].map(&:to_i)


#---------------------why use***proc---------------------
#block无法单独存在， 必须挂在方法后面， 并且没有办法直接把它存到变量里，也没有办法将它作为参数传递给方法
#所以当你想存储，传递block时， 可以使用proc对象。
def example_five
  yield
end
example_five{proc{p 'hello'}.call}


#---------------------***---------------------
# &p是block   p是proc， 不到万不得已的情况下不要显示的创建proc
def example_six(p, &q)  #这也很好的说明 p=>proc 是方法的参数    &q是block，是一个申明。  不推荐把proc作为块传入
  a = p.call
  b = q.call
  a + b
end
p example_six(proc{2}) {3}      #5

#---------------------***---------------------
#block 可以传递参数      block不会检查参数个数
def example_seven
  yield(2, 3) if block_given?
end
p example_seven{|i, j, m, n, a, z| i*j}  #6

#block 和 proc是两种不同的东西， block有形无体， proc可以将block实体化
#可以把&p看做一种运算， 其中&触发p的to_proc方法, 然后&会将to_proc返回的proc对象转成block


#---------------------***---------------------
#lambda 是匿名方法， lambda和proc也是两种不同的东西， 但是ruby中lambda只能依附proc而存在



