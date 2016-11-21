#使用local_variables来获取当前作用域变量
variable1 = 1
def test
  variable2 = 2
  p local_variables
end
p local_variables  #variable1
test  #:variable2

#-------
#说明方法里的作用域是局部作用域  和外界只能通过参数的形式发生交流
#-------
p '--------------------'

v1 = 'a'
class Demo
  v2 = 'b'

  p local_variables

  def test
    v3 ='c'
    p local_variables
  end

  p local_variables
end

obj = Demo.new # [:v2]  [:v2]
obj.test #[:v3]
obj.test #[:v3]
p local_variables #[:v1, :obj]

#---------------------
#说明不管是否在块中， 方法的作用域都是局部的   和外界不相往来
#并且块中定义的变量 所属的作用域 也只是这个块  不会影响到外界
#---------------------

#由于当前作用域实在main中，当前的self表示的就是main对象  当前的实例变量也就是main对象的实例变量
#所以我们可以用实例变量来替代全局变量使用，这会安全一些。  因为全局变量可以被任何人修改，而且很难找到作案者
@name = 'Ricky'
def say_name
  p self#main
  p @name
end

say_name #Ricky

#由于不管当前的对象self 不管是方法还是变量都是main   所以这种变量就可以相互访问到了


class Change
  p self
  p @name #nil     此时就进入到新的作用域了  此时的self是Change
end

p self.class