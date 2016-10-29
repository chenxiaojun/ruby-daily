#可以通过  对象.class 判断这个对象所属的类， 通过instance_of? 判断某个对象是否是某个类的实例。
#类名和模块名必须大写。
class A
end
a = A.new
puts a.class  #A
puts a.instance_of?(A) #true
puts a.is_a?(A)#true 和 instance_of效果一样。我们不是一样的  你们系统内置



class Test
  def initialize(name) #相当于php里面的construct
    @name = name
  end

  def print_name
    @name
  end
end

t = Test.new('Ricky')
p t.print_name


p '------------------*-------------------'

class Example

  attr_accessor :name
  attr_accessor :hobby

  @@number = 123

  Version = '1.0'

  def initialize(name, hobby)
    @name  = name
    @hobby = hobby
  end

  def say_hello
    puts "Hello #{name}"  #因为前面定义了 attr_accessor 所以这里可以不用@
  end

  def self.say_nothing
    puts "#{@@number}"
  end

  class << self
    def class_fun
      puts 'say nothing'
    end
  end
end

e = Example.new('Ricky', 'Ruby')
p e.name
e.hobby = 'Go'
p e.hobby

e.say_hello
Example.say_nothing
Example.class_fun
p Example::Version    #访问常量 使用::的形式