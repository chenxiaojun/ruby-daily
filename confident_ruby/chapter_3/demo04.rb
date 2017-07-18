now = Time.now
# respond_to? 判断某个对象是否可以响应某个方法
p now.respond_to?(:to_s)
p now.to_s
p now.respond_to?(:to_str)

# 字符串调用to_str返回的是它自身
p "Hello, World!".to_str

#
class Title
  def initialize(text)
    @text = text
  end

  def to_str
    @text
  end

  # def to_s
  #   to_str
  # end
end

# 1 Ruby中的每一个类都实现了to_s方法
# 2 Ruby核心类 从来不会 自动调用显示类型转换方法
# 3 Ruby核心类 从来不会 像调用to_str一样隐式调用他们
# 4 显示调用是为开发者准备的

title = Title.new("Ricky")
p 'I love Ruby, ' + title
p title.to_s

# 如果一个方法期待得到某个特定类型的输入(比如Integer) 那么可使用标准类型转换方法 以确保得到的输入能满足预期
# 如果想让输入更具有灵活性，则可使用显示类型转换方法， 比如to_i

# 当它是该种类型时 隐式和显式的方法都生效，如果不是，那么只有显式的生效

p 4.to_i # 4
p 4.to_int # 4

p nil.to_i  # 0
p nil.to_int #demo04.rb:38:in `<main>': undefined method `to_integer' for nil:NilClass (NoMethodError)

