#Ruby程序运行时， Ruby解释器就会创建一个名为main的对象作为当前对象
p self #main
p self.class #Object

class C
  def public_method
    # self.private_method   #调用私有方法只能类内部隐式调用， 不能使用self关键字明式调用
    private_method
  end

  private
  def private_method; end
end

c = C.new
c.public_method



#细化
module StringExtensions
  refine String do
    def to_alphanumeric
      gsub(/[^\w\s]/, '')
    end
  end
end
#代码为String类细化了一个to_alphanumeric方法， 只有using这个模块的时候才生效
# p "1d***23@@!!23 4sdf".to_alphanumeric

using StringExtensions
p "1d***23@@!!23 4sdf".to_alphanumeric
