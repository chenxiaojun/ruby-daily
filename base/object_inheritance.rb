class A
  @@number = 123
  def self.number
    @@number
  end
end

p A.number  #123

class B < A
  @@number = 999
end
p A.number  #999   说明类变量被继承后，可以覆盖掉父类中的值
p B.number  #999

class C < A
  @@number = 555
end
p A.number #555
p B.number #555
p C.number #555

p '-------------------------------'

class A
  @number = 10
end
puts A.class_variables      #@@number
puts A.instance_variables   #@number

class D
  attr_accessor :sides
  @sides = 10
end
#p D.sides  # undefined method `sides'
p D.new.sides # nil  ?????

class E
  class << self
    attr_accessor :sides
  end
  @sides = 8
end
p E.sides  #8

class F < E
  @sides = 3
end
p F.sides #3


class G
  attr_accessor :sides
  @sides = 789
end
g = G.new
g.sides = 1024
p g.sides

