# 我们有一个类A 如果我们想把一些共有实例方法和类方法全部放到一个模块B中 实现 ？
module B
  # 使用一个钩子来实现对外增加类方法
  def self.included(base)
    base.extend ClassMethod # 使用extend继承的是类方法
  end

  def say_hello
    puts 'I am an instance method'
  end

  module ClassMethod
    def say_hello
      puts 'I am an class method'
    end
  end
end

class A
  include B  # 使用include过来的方法是实例方法
end

a = A.new
puts a.say_hello  # I am an instance method
puts A.say_hello  # I am an class method
