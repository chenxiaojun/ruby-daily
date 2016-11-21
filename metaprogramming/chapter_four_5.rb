#Proc
#ruby中绝大多数东西都是对象， 但代码块不是
#如果我们想存储一个块以后执行，就要先把块转化为proc对象
proc = Proc.new do |x|
  x ** 3
end

p proc.call(2)


#关于&操作符
#虽然我们可以使用yield直接接收代码块， 但如果我们想在接收到代码块后，进行二次转发
#yield就力不从心了。 此时我们可以使用&符号来接收到块， 方法中去掉& 接收的块就可以直接被调用到了，如果想传递，方法里面使用&name来传递
# &name  ->  Proc对象  -> name就是一个block了
def my_method(x, y, &block)
  block.call(x, y)
end

my_method(2, 5){|a, b| p a + b}

p '------------------'
proc = proc{puts 'haha'}
proc.call    #haha
p '---'
# &符号会将proc对象转化为代码块
p &proc.call #haha  这地方必须加上p打印出来，不然会报错
my_method(1, 2, &proc)
my_method(4, 6, &lambda{|a, b| puts 'xxxx'})  #如果这地方去掉& 那么相应方法里面直接用普通参数的形式接收就好了


p '--------------****&&^%^-----------------'

class Thinking
  def initialize(value)
    @v = value
  end

  def get_val
    @v
  end
end

obj = Thinking.new(2)
o = obj.method :get_val #这里去调用了Kernel#method方法，可以获得一个用Method对象表示的方法 后面可以使用Method#call进行调用
#Method对象类似于代码块或lambda
p o.call #2
p o.class