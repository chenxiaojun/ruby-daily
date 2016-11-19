#问题1： 对象的方法是存放于类中，对象中仅存放它的实例变量以及所属类的引用   那么使用instance_eval定义的 对象所属的方法存放在哪里
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




