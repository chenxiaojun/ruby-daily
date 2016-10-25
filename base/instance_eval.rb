#instance_eval 的调用者receiver必须是一个实例instance
#在instance_eval block的内部， self即为receiver实例本身

#所以如果我们在一个实例上调用了instance_eval, 就可以在其中定义该实例的单态函数
class A
end

a = A.new
a.instance_eval do
  def sayHi  #这个方法固属于a这个对象
    "Hi"
  end
end
p a.sayHi  #hi

#b = A.new
#b.sayHi    #method undefined


#因为class类本身也是class类的一个实例， 所以instance_eval也可以用来定义类函数
class B
end

B.instance_eval do
  def sayHello
    p "Hello"
  end
end
B.sayHello  # Hello