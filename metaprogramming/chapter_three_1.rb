#动态调用方法
class MyClass
  def my_method(my_arg)
    p my_arg * 2
  end
end

obj = MyClass.new
obj.my_method(3)  #6

#也可以使用Object#send方法代替点标识符来调用MyClass#my_method方法

obj.send(:my_method, 4)  #8



def test
  p 'Ricky'
end

send(:test)

p '-------------'

class A
  private
  def test
    p 'haha'
  end
end

A.new.send(:test) #haha
#A.new.public_send(:test)#这种方式访问就不会破坏面向对象私有化的特性





