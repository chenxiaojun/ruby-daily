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
