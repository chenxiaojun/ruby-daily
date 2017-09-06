# def my_open(filename)
#   filename = filename.to_path if filename.respond_to?(:to_path)
#   filename = filename.to_str
#   p filename
# end
#
# my_open("~/test.txt")
# my_open(Class.new) # undefined method `to_str' for #<Class:0x007ff1ea0c4f48> (NoMethodError)


# 自定义类型转换协议
# 我们想接收的是一个点或一对坐标
# 然后通过传递过来的2个坐标画一条线
def draw_line(start, endpoint)
  start = start.to_croods if start.respond_to?(:to_croods)
  start.to_ary

  endpoint = endpoint.to_croods if endpoint.respond_to?(:to_croods)
  endpoint.to_ary

  p start, endpoint
end

class Point
  attr_reader :x, :y, :name

  def initialize(x, y, name = nil)
    @x, @y, @name = x, y, name
  end

  def to_croods
    [x, y]
  end
end

start = Point.new(3, 6)
endpoint = Point.new(5, 9)
draw_line(start, endpoint)
