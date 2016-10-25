class Foo
  @@cls_var = 'foo'
  @cls_instvar = 'foo'

  def test
    p "instance:"
    p "  class variable: #{@@cls_var}"
    p "  class instance variable: #{@cls_instvar}"
  end

  def self.test
    p "class:"
    p "  class variable: #{@@cls_var}"
    p "  class instance variable: #{@cls_instvar}"
  end
end

class Bar < Foo
  @@cls_var = 'bar'
  @cls_instvar = 'bar'
end

f = Foo.new
f.test #通过Foo的对象 去调用一个实例方法  然后实例方法里面打印了实例变量和类变量      发现类变量无法识别
Foo.test #直接通过类去方法类方法  类方法中输出实例变量和类变量  类方法可以访问到实例变量和类变量
b = Bar.new
b.test
Bar.test