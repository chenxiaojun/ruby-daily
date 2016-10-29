class A
  def example_one
    'example one'
  end
  public :example_one

  def example_two
    'example two'
  end
  private :example_two

  def example_three
    p example_one ##example one
    p example_two ##example two
  end
  public :example_three

  def example_five
    'example five'
  end
  protected :example_five

  def example_six
    p example_five #example five
  end
  public :example_six
end

#尝试类外访问
test = A.new
p test.example_one  #example one
#p test.example_two  #private method `example_two' called for #<A:0x007fa25c088b98> (NoMethodError)
test.example_three
#test.example_five   # protected method `example_five' called for #<A:0x007fe25a873ae0> (NoMethodError)
test.example_six
p '--------&---------'
class B < A
  def example_four
    p example_one  # example one
    #p self.example_two  # private method `example_two' called for #<B:0x007fedfc84f7a0> (NoMethodError)
    p example_two  # example two
    p example_five # example five
  end
end
B.new.example_four


#总结
# public方法可以被定义它的类 和 子类访问    并且可以被它的实例对象调用(类外部可访问)
# protected可以被它定义的类 和 子类访问    不能被类和子类的实例对象调用(类外不能访问)   但可以被该类其它的实例对象访问
# private可以被它定义的类和子类访问        不能被类和子类的实例对象调用(类外不能访问)   且实例对象只能访问自己的private方法 必须是self 也必须省略