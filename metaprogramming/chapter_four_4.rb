class MyClass
  def initialize
    @v = 1
  end

  private
  def private_method
    'HaHa'
  end
end

obj = MyClass.new

#使用instance_eval  代码块里面的接收者还是self，同MyClass。 因为我们就可以在instance_eval里面调用MyClass里面的私有方法以及成员变量了
#下面的v 和代码块的在一个扁平作用域里面。 因此他们都可以访问局部变量
#我们把传递给instance_eval方法的代码块称为上下文探针
v = 23
obj.instance_eval do
  @v = 23
  p private_method
end

p obj


class Test
  def initialize
    @name = 'Ricky'
  end
end

class Demo
  def test
    @hobby = 'ruby'
    Test.new.instance_exec(@hobby){|h| p "#{@name}, #{h}"}
  end
end

Demo.new.test