class MyClass
  define_method :my_method do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
p obj.my_method(5) #15


#method_missing是BasicObject的一个私有方法，而所有的对象都继承自BasicObject，所以它对所有对象都可用
#然后又知道send可以调用到私有方法，然后当前作用域对象又继承自BasicObject， 所以可以如下调用
p self.class
send(:method_missing, :Ricky)

