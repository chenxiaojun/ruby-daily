#问题1： 对象的方法是存放于类中，对象中仅存放它的实例变量以及所属类的引用   那么使用instance_eval定义的 对象所属的方法存放在哪里
# 如果在单例类里 那么单例类和A的所属类又是如何共存的
class A
  def test1; end
end

a = A.new
p a.class.instance_methods.grep(/^test/)  #[:test1]

a.instance_eval do
  def test2; end
end
p a.methods.grep(/^test/) #[:test2, :test1]
p a.class.instance_methods.grep(/^test/)  #[:test1]


#问题2   String是Class类的一个实例， String继承自Object   这种思想如何用代码来实现  比如有A,B,C三个类，如何实现A继承自B，并且A是C的实例
p String.class      #Class
p String.superclass #Object




