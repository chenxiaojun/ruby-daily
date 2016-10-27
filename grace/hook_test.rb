module Animal
  def eat
    'I like fish'
  end
end

module Cat
  def self.extended(base)
    base.class_eval do
      include Animal
    end
  end

  def color
    'Cat have many colors'
  end
end


class RedCat
  extend Cat
end

p RedCat.color
p RedCat.new.eat
p RedCat.ancestors #[RedCat, Animal, Object, Kernel, BasicObject]
p RedCat.singleton_class.ancestors #[#<Class:RedCat>, Cat, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]

#说明
#RedCat.ancestors 打印的是RedCat实例的祖先类
#RedCat.singleton_class.ancestors 打印的是RedCat 类的祖先类