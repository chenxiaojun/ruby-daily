require 'forwardable'

class Test
  extend Forwardable

  def initialize
    @q = []
  end

  def_delegator :@q, :push, :enq
  def_delegator :@q, :shift, :deq

  def_delegators :@q, :clear, :first, :push, :shift, :size
end

q = Test.new
q.enq 1, 2, 3
p q.first
while q.size > 0
  p q.deq
end


# 上面的方法等价于
class TestSame
  extend Forwardable

  def initialize
    @q = []
  end

  def enq(*args, &block)
    @q.push(*args, &block)
  end

  def deq(*args, &block)
    @q.shift(*args, &block)
  end

  def size
    @q.size
  end

  def first
    @q.first
  end
end

q2 = TestSame.new
q2.enq 1, 2, 3
p q2.first
while q2.size > 0
  p q2.deq
end
