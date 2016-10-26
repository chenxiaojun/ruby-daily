#ruby世界中， 作用域之间是截然分开的，一旦进入另外一个作用域，原先的绑定就会替换为一组新的绑定。
#可以通过local_variables方法查看当前作用域下的绑定

#Ruby程序只会在3个地方 关闭前一个作用域。  同时打开一个新的作用域
    #类定义    class...end
    #模块定义   module...end
    #方法定义   def...end


v1 = 1
class MyClass
  v2 = 2
  puts local_variables.to_s + "call 1"
  def my_method
    v3 = 3
    puts local_variables.to_s + "call 2"
  end
  puts local_variables.to_s + "call 3"
end

obj = MyClass.new
obj.my_method
puts local_variables.to_s + "call 4"

puts '--------****----------'

u = 'u'
def test(x)
  t = 34
  puts local_variables.to_s + 'method'
  yield(x)
end
z = 8
y = 6
test(y) do |x|
  h = 123
  puts local_variables.to_s + 'block'    #说明块可以读取到非def class module里面的变量
  p x+y
end
puts local_variables.to_s + 'main'  #读取不到块里面的