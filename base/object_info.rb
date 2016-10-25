# 1, 对象是由类生成的，而类本身也是对象
# 2, ruby顶级类是Object，其余所有类都直接或间接继承自Object
# 3, Class继承自Module, Module继承Object  而所有对象其实是Class类的实例,所以Object也是Class的实例

# Ruby任何对象都有以下三个变量
  #  4, klass指针， 对象中的klass指针指向这个对象所属的类
  #  5, iv_tbl 是一个保存该对象实例变量的哈希信息
  #  6, flags  顾名思义是对象的标志信息变量 用以标志对象是否被污染是否被回收是否被冻结等信息

  #  7, super指针，指向该类所继承的父类 或者说是该模块里所引用的某个模块
  #  8, m_tbl 实例方法表

# more
  #  9  实例变量都保存在对象自己的数据结构中  方法都是保存在类中
  #  10 类中保存的方法只有实例方法，类方法？  其实类方法也是实例方法，是类的实例方法，保存在类的单例类中。

class Class
  def show
    puts "hello"
  end
end

Class.show

class Person
  @age = 123
  def name
    @name = 'Ricky lala'
  end
end
p = Person.new
puts p.instance_variables
p.name
puts p.instance_variables