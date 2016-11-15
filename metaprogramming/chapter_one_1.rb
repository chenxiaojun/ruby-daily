class People
  def initialize(name)
    @name = name
  end

  def say_name
    @name
  end
end

person = People.new('Ricky')
p person.say_name #Ricky

p person.class#People
p person.instance_variables #[:@name]

p person.class.instance_variables # []   类的实例变量  []

p person.class.instance_methods #参数默认是true   会打印这个类的所有实例方法  以及他继承的类中的实例方法 [:say_name]
p person.class.instance_methods(false) #参数设置为true  只会打印当前类里面的实例方法[:say_name]\


p People.ancestors #[People, Object, Kernel, BasicObject]
p People.singleton_class.ancestors #[#<Class:People>, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]


