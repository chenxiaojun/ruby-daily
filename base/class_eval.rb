#class_eval 顾名思义， class_eval的调用者必须是一个类
#在class_eval类内部，self即为 receiver类本身

class A
end

A.class_eval do
  def sayNo   #这个方法是类的一个实例方法
    puts 'No'
  end
end

a = A.new
a.sayNo  #No

b = A.new
b.sayNo



#一句话总结
#  instance_eval 必须由instance来调用， 可以用来定义单态函数  固属于某个对象
#  class_eval    必须由类作为接受者， 可以用来定义类中的实例方法的