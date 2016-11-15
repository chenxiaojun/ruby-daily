# def to_alphanumeric(str)
#   #去掉字符串中的标点特殊字符 只保留数字 字母和空格
#   str.gsub(/[^\w\s]/, '')
# end
#
# p to_alphanumeric('a2###@@sdfs!  sdf555.,sdf')

#上面这种写法不太符合面向对象的规范。  更好的办法是应该让字符串本身来做这种转换，而不是把工作交给外部方法
class String
  def to_alphanumeric
    gsub(/[^\w\s]/, '')
  end
end

p 'a2###@@sdfs!  sdf555.,sdf'.to_alphanumeric


#Ruby中 可以在类定义中放置任何语句
3.times do
  class C
    puts 'hello'
  end
end
#会输出3个hello

#但并不是每次打开类都会遇到好事，比如你不小心覆盖了系统类某个方法，而你的项目其它地方需要用到这个方法，那么就over了
#ary.replace(other_ary)  -> ary
test = [1, 3, 4]
test.replace([4, 5, 6])
p test #456

#重新打开Array
class Array
  def replace(original, replacement)
    self.map{|e| e == original ? replacement : e}
  end
end

demo = [7, 8, 9]
p demo.replace(8, 10)  #7 10 9
#如果这个Array在上面那个之前定义   程序就会出错
#我们可以定义一个类中不存在的方法名  来实现这个功能    这个做法称作   猴子补丁
#查看一个类中的方法
p [].methods
p '------'
p ''.methods.grep(/^s/)  #查询想要了解的方法








