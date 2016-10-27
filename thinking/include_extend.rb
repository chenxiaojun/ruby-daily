module A
  def func_a
    puts 'func_a'
  end
end

module B
  include A
  def func_b
    puts 'func_b'
  end
end

class C
  extend B
end

C.func_b
C.func_a
p C.ancestors #[C, Object, Kernel, BasicObject]
p C.singleton_class.ancestors #[#<Class:C>, B, A, #<Class:Object>, #<Class:BasicObject>, Class, Module, Object, Kernel, BasicObject]
p C.new.singleton_class.ancestors #[#<Class:#<C:0x007ff26a0dd900>>, C, Object, Kernel, BasicObject]
p C.is_a?(A)  #true
p C.is_a?(B)  #true
p C.new.is_a?(A) #false

class D
  include B
end
p '-------------*--------------'
D.new.func_b  #func_b
D.new.func_a  #func_a
p D.ancestors #[D, B, A, Object, Kernel, BasicObject]
p D.singleton_class.ancestors #[#<Class:D>, #<Class:Object>, #<Class:BasicObject>,Class, Module, Object, Kernel, BasicObject]
p D.is_a?(A)  #false
p D.is_a?(B)  #false
p D.new.is_a?(B)  #true