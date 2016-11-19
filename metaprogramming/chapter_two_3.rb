class A
  def my_method
    "haha"
  end
end

class B < A; end

module C
  def cc
    "cc"
  end
end
module D
  def dd
    "dd"
  end
end
module E; end

class B
  include C
  extend  D
  prepend E
end

p B.dd #dd
p B.new.cc #cc
#使用祖先链 可以查看一个类所有的继承关系 即所有的superclass 包括模块
#prepend方法和include类似  只不过它会把类插到当前类的前面
#include和继承类似，相当于直接把被include的类里面的方法放到included的类中 而extend则不一样，extend过来的是类方法 方法前面默认带了self.
p B.ancestors #E B C A Object Kernel BasicObject


#从上面的例子中 我们就可以看出一般对象的继承类里都有Object类，而Object里面又include了Kernel模块，那么只要定义在Kernel里面的方法  任何对象都可以
#调用了。   下面可以打印看下内核类Kernel里的私有方法以p开头的有print   难怪我们可以随时随地用
p Kernel.private_instance_methods.grep(/^p/)


module Kernel
  private
  def say_hello(arg)
    p 'Hello '+arg
  end
end

say_hello 'Ricky'  #Hello Ricky


