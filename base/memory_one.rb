class Test
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def inspect
    "#{x}, #{y}"
  end

  def -@
    self.class.new(-x, -y)
  end

  def +@
    self
  end
end

t = Test.new(5, 8)
p -t
p +t