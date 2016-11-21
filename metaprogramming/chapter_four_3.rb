my_var = "success"

#使用这种方式定义一个类的好处是
#在进入class层，可以访问到外部变量
#使用这种动态方法  在进入实例方法层，也可以访问到外部变量
p my_var #"success"
p self #main
p local_variables

Myclass = Class.new do
  p self #<Class:0x007fd021050ea8>
  p local_variables
  p my_var #"success"

  define_method :my_method do
    p self #<Myclass:0x007fd02104bc50>
    p local_variables
    p my_var #"success"
  end
end
Myclass.new.my_method

p '------------------------------------'

#掌握了扁平作用域， 就拥有了控制作用域的能力。

def define_methods
  shared = 0
  Kernel.send :define_method, :counter do
    shared
  end
  Kernel.send :define_method, :inc do |x|
    shared += x
  end
end

define_methods
p counter
p inc(4)
p counter


p '-------------------'

class MyClass
  def initialize
    @v = 1
  end
end

obj = MyClass.new

obj.instance_eval do
  p self
  p self.singleton_class.instance_methods
  p self.class.instance_methods
  p @v
  p local_variables
end