module A
  def self.included(base)
    puts "one"
  end
end

module B
  def self.included(base)
    puts "two"
  end
end

class C
  include A
  include B
  include A
end

p C.ancestors  #一个类被包含两次  第二次会忽略
p C.instance_of?(Class)

