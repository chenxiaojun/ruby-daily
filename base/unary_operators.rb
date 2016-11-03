#可定义的一元运算符有 +, -, ~, !
#它们分别以+@, -@, ~@, !@为方法名进行方法定义  一元运算符没有参数
class Unary
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def inspect
    "#{x}, #{y}"
  end

  def +@
    dup   #返回自己的副本
  end

  def -@
    self.class.new(-x, -y) #颠倒x，y各自的正负
  end

  def -
    self.class.new(-x, y)
  end
end

unary_one = Unary.new(3, 6)
p +unary_one
p -unary_one
p unary_one.-