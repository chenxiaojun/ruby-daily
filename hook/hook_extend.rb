# Ruby也允许开发者 扩展(extend)一个模块， 这与 包含(include)不同
# extend 是将定义在 模块(module)内的方法应用为类的方法 不是实例方法

module Person
  def name
    p 'I am Ricky!'
  end
end

class User
  extend Person
end

User.name  #I am Ricky!

puts '------------***------------'
u1 = User.new
u2 = User.new

u1.extend Person
u1.name
#u2.name   #error
puts '------------***------------'

module Animal
  def self.extended(base)
    puts "#{base} extend #{self}"   #Cat extend Animal
  end

  def say_name
    p 'I am Micky!'
  end
end

class Cat
  extend Animal
end
Cat.say_name

