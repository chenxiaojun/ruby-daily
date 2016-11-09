


# class Example
#   # & 符号可以触发 对象的 to_proc 方法
#   def to_proc
#     ->(x){p x}
#   end
# end
#
# e = Example.new
# p ['Hi', 'Hello', 'Goodbye'].map(&e)


# class AddBy
#   def initialize(num = 0)
#     @num = num
#   end
#
#   def to_proc
#     Proc.new {|obj| obj.send('+', @num)}
#   end
#
# end
#
# add_by_9 = AddBy.new(9)
# puts [1,2,3].map(&add_by_9) #输出 [10, 11, 12]


#  :to_i.class -> Symbol


#example
class String
  def to_proc
    ->(x, y){ puts x ** y }
  end
end

def test(&block)
  #yield(2, 5)
  block.call(2, 6)
end

test(&"hehe")

# 1, &符号会触发"hehe" 这个对象所属类里面的to_proc方法
# 2, 然后进入到String类里面 调用to_proc,  并返回一个proc实例回来
# 3, 返回的proc实例连接一个&   把相当于在执行test(){返回的实例里面的代码块}
# 4， 然后block.call  就去执行这个代码块  返回2 ** 6 = 32

block = lambda{|x, b| puts b ** x}
test(&block)



p ('a'..'z').to_a.collect(&:upcase)
p ['ricky', 'mary', 'lili', 'jack'].map(&:capitalize)


p '-------&*(&(&(&(&(-------'

class Symbol  # reopen Symbol class to reimplement to_proc method
  def my_to_proc
    #->(object) { object.send(self) }
    lambda do |object|
      p object
      p self

      object.send(self)
    end
  end
end

my_lambda = :to_s.my_to_proc

puts my_lambda.(1)  # prints '1'; .() does the same thing as .call()
# puts my_lambda.(1).class  # prints 'String'
#
# puts [4,5,6].map(&:to_s)  # prints "4\n5\n6\n"
# puts [4,5,6].map(&:to_s).first.class  # prints 'String'


p '+++++++++++++++++++++++++++'

class String
  def to_proc
    ->(str){self+' '+str.capitalize}
  end
end

p ['ricky', 'mary'].map(&"Hello")







