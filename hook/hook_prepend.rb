#include extend 将模块中的方法引入到class中， 如果class中有同名的方法 将会覆盖掉module里面的
#prepend与之不一样，prepend会将模块里面的方法去覆盖掉类里面的同名方法
module A
  def name
    puts 'Hi'
  end
end

module C
  def color
    puts 'red'
  end
end

module D
  def self.prepended(base)
    puts "#{self}--**--#{base}" #D--**--B
  end

  def hobby
    puts 'Ruby'
  end
end

class B
  include A
  extend C
  prepend D

  def name
    puts 'Hello'
  end

  def self.color
    puts 'green'
  end

  def hobby
    puts 'PHP'
  end
end

B.new.name  #Hello
B.color #green
B.new.hobby #Ruby