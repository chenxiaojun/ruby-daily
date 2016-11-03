#深拷贝 浅拷贝
#拷贝的目的 是为了得到两个看起来一样，但本质上又不一样的对象。
a = 3
b = a
puts a.object_id  #7    说明a,b指向同一块空间，是同一个东西
puts b.object_id  #7


module Haha
  def self.extended(base)
    obj = base.new
    obj.instance_eval do
      def say_bye
          puts 'say bye'
      end
    end
    obj.say_bye  #这个对象其实产生一次 外面就再也没有了  所以这里定义实例方法没意义
  end

end

module Hehe
  def say_no
    puts 'say no'
  end
end

class Heihei
  def say_yes
    puts 'say yes'
  end
end

class Demo < Heihei
  extend Haha
  include Hehe
  attr_accessor :x, :y
  def initialize(x = 1, y = 2)
    self.x = x
    self.y = y
  end

  def my_method
    puts 'I am Ricky'
  end
end

d = Demo.new(4, 9)
f = d
h = d.dup
g = d.clone

d.instance_eval do
  def dodo
    puts 'hello'
  end
end

f.dodo  #这也说明了 用 = 号赋值得到的是同一个对象
# h.dodo # undefined method `dodo'
# g.dodo # undefined method `dodo'
p d.object_id
p f.object_id
p h.object_id
p g.object_id   #d,f是一样的   h,g都是不同的对象


p d.x, f.x, h.x, g.x  #都是4
d.my_method
f.my_method
h.my_method
g.my_method #都是I am Ricky

d.say_yes
f.say_yes
h.say_yes
g.say_yes #都是yes  说明继承的都是直接拷贝

d.say_no
f.say_no
g.say_no
h.say_no  #都是say_no 说明include的也都可以

#
# d.say_bye #extended里面设置的对象无法调用
puts Demo.instance_methods.inspect
p '------------------***------------------'


#对象的定义是一组实例变量 + 一个指向其类的引用, 但如果这个对象的某个实例变量又依赖于另一个对象，那么怎么办?

#浅拷贝  Ruby中有两个方法clone, dup， 它们都是kernel中定义的方法  dup不会对extended的module进行拷贝
#通过instance_eval加上去的方法  可以被clone 不能被dup   clone可以复制单例方法


#深拷贝， ruby并没有一个现成的方法来对实现的对象进行深拷贝， 目前常用的一个是Marshal
#Marshal.load(Marshal.dump(obj))

#深拷贝的时候 被拷贝的对象不可有单例方法   浅拷贝的时候可以有,因为浅拷贝会忽略这个单例方法
k = Marshal.load(Marshal.dump(h))
# p k.test  #in `dump': singleton can't be dumped
k.say_no

last = [1, 2, 3]
obj = ['haha', {hobby:'computer'}]
example = ['ricky', ['name', 'age'], obj]
x = example
y = example.dup
z = example.clone
v = Marshal.load(Marshal.dump(x))
w = x
puts x.inspect, y.inspect, z.inspect, v.inspect, w.inspect



class  Siya
end

s = Siya.new
def s.hello
  puts 'hello'
end

ss = s
sss = s.clone
ssss = s.dup

ss.hello
sss.hello
# ssss.hello #error
# 说明dup不能复制单例方法

s.instance_eval do
  def heh
    puts 'heh'
  end
end

s.heh
ss.heh
# sss.heh  #error