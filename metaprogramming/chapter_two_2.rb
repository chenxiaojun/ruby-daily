class MyClass
  def my_method
    @v = 1
  end
end

obj = MyClass.new
p obj.class  #MyClass
p MyClass.instance_methods
p obj.methods

p '----------'
#如果你不调用类中的实例方法， 那么你创建的这个对象就不会有实例变量。
p obj.instance_variables  # []
p obj.my_method
p obj.instance_variables  # [:@v]


#通过object#methods 获取一个对象的方法列表
p obj.methods
p obj.methods.grep(/^my/)

p '------------'

class Myclass; end

p Myclass.class       #Class  说明Myclass
p Myclass.superclass  #Object

p Class.superclass    #Module
p Class.class         #Class

p Module.class        #Class
p Module.superclass   #Object

p Object.class        #Class
p Object.superclass   #BasicObject

#任何一个类都是class类的实例，包括class类本身

class A
  def test1
  end
end

a = A.new
p a.class.instance_methods.grep(/^test/)  #[:test1]

a.instance_eval do
  def test2
  end
end
p a.methods.grep(/^test/) #[:test2, :test1]
p a.class.instance_methods.grep(/^test/)  #[:test1]
#问题： 既然对象的方法是存放于类中， 那么使用instance_eval定义的 对象所属方法存放在哪里

p a.class.ancestors  #[A, Object, Kernel, BasicObject]
p a.class.superclass     #Object


#类名 模块名其实就是常量， 是一种特殊的变量，和普通变量相比他们的作用域不同。  我们甚至可以修改String类的类名
RICKY = 'GEEK'
RICKY = 'HAHA'
p RICKY

module M
  class C
    X = 'c constant'
    module M2
      p Module.nesting
    end
  end
  C::X
end
p M::C::X

module M
  Y = 'm constant'
end

#M.constants返回当前范围内的所有常量
p M.constants


