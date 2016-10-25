# Ruby 提供了四种类型的变量
  # 局部变量： 局部变量是在一个方法中定义的变量。 一般以小写字母或_开头
  # 实例变量： 实例变量是可跨越任何特定实例或对象的方法。  实例变量前面加上 @符号  跟着变量名
  #   类变量： 类变量是属于这个类的，用@@跟着变量名
  # 全局变量：  类变量不能跨类  全局变量的前面总是用 美元符号($)
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

person = Person.new('ricky')
person.name = 'mary'
p person.name
