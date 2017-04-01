module C
  def self.included base
    base.extend ClassMethod
  end

  def say_yes
    'yes instance'
  end

  module ClassMethod
    def say_yes
      'yes class'
    end
  end
end

module B
  def self.included base
    base.extend ClassMethod
    # base.include C   加上这句，才可以将A作为base传递到C中  但如果其它类也要引入B，这里就会有问题了。
  end

  def say_no
    'instance method'
  end

  module ClassMethod
    def say_no
      'class method'
    end
  end

  include C
end

class A
  include B
end

puts A.say_no # class method
puts A.new.say_no # instance method
puts A.new.say_yes # yes instance
puts A.say_yes # error

# 错误分析：
# 在C中接收到的base是类B， 所以产生的类方法say_yes是类B的类方法，在A中是不存在的。
