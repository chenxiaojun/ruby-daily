# Ruby 给我们提供了一种方式使用 模块(modules) -> (在其它语言中称作 混入类(mixins)) 来编写模块化的代码
# 简单的理解模块，就是一个 可以在其它地方使用的独立代码块

module Person
  def name
    'My name is Ricky'
  end
end

class Example
  include Person
end

#include 这里的作用就是载入Person这个模块  然后将模块里面的name方法赋予Example的实例变量。
#相当于我们将name方法写在了Example中一样，放在模块里的好处就是可复用。

e = Example.new
p e.name  # My name is Ricky


p '---------------***---------------'

# 基于include的钩子方法。  included 是Ruby提供的一个钩子方法
# 当在一些module 或者 class 中include一个 module时它会被调用
module Animal
  def self.included(base)   # base 返回的是包含该模块的类名
    puts "#{base} included #{self}"
  end

  def name
    puts 'My name is Person'
  end
end

class Cat
  include Animal
end

Cat.new.name  #Cat included Animal   My name is Person



























