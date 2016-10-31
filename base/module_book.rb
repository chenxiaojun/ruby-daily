module Test
  def self.example_one
    p 'Hello'
  end
end

Test.example_one



module A
  Pi = 3.14
  def a
    'a'
  end
end

class B
  include A
end

p B::Pi


class C
  def sayHello
    p 'Hello'
  end
end

class D < C
end

class E < C
end

D.new.sayHello
E.new.sayHello

# class E < D  # superclass mismatch for class E (TypeError)
# end

#不支持一个类集成自多个类    想要这么使用，那么请使用module

p '--------*---------'
module Lei
  def hello
    p 'Hello, Ricky!'
  end
  module_function :hello
end

Lei.hello  #"Hello, Ricky!"
