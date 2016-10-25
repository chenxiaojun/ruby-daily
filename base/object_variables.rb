#example one
class Foo
  @@name = 'foo'
end
p Foo.name   #输出类名

#example two
class Hoo
  @@name = 'hello'
  def self.name
    @@name
  end
end
p Hoo.name #调用类的成员方法

#example three
class Joo
  attr_accessor :gendal
  def initialize gendal
    @gendal = gendal
  end
end
j = Joo.new('male')
p j.gendal