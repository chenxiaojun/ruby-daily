module Example
  module ClassMethods
    def test
      "haha"
    end
  end

  module InstanceMethods
    def demo
      "hehe"
    end
  end

  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :include, InstanceMethods
  end
end


class A
  include Example
end

p A.test
p A.new.demo


p '---------***----------'


module ExtendThroughInclude
  def self.included(klass)
    klass.extend ClassMethods
  end

  def instance_method
    "this is an instance of #{self.class}"
  end

  module ClassMethods
    def class_method
      "this is a method on the #{self} class"
    end
  end
end

class Person
  include ExtendThroughInclude
end



