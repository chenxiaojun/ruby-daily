#下标方法
#定义下标方法时， 方法名分别为[] 和[]=

class SupFunc
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def inspect
    "#{x}, #{y}"
  end

  def [](index)
    case index
    when 0
      x
    when 1
      y
    else
      raise ArgumentError, "out of range #{index}"
    end
  end

  def []=(index, value)
    case index
    when 0
      self.x = value
      when 1
      self.y = value
    else
      raise ArgumentError, "OUT OF RANGE"
    end
  end

  def test
    p "hehe"
  end
end


sup1 = SupFunc.new(3, 6)
p sup1[0]
# p sup1[](1)  #不支持
sup1.test


sup1[1] = 'Ricky'
p sup1