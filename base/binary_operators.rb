#Ruby的运算符大多都是作为实例方法提供给我们使用，因此我们可以很方便的定义和重定义运算符
#但有些运算符是不可以修改的 ::, &&, ||, .., ..., ?:, not, =, and, or

class Binary_operator
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def inspect  #用于显示
    "#{x}, #{y}"
  end

  def +(other)
    self.class.new(x + other.x, y + other.y)
  end

  def -(other)
    self.class.new(x - other.x, y - other.y)
  end
end

operator_one = Binary_operator.new(3, 5)
operator_two = Binary_operator.new(1, 9)

p operator_one
p operator_two

p operator_one.class
p operator_one.+ operator_two
operator_three = operator_one - operator_two
p operator_three.class