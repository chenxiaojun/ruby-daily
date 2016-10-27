class Example
  def initialize(name)
    @name = name
  end

  # & 符号可以触发 对象的 to_proc 方法
  def to_proc
    ->(x){p x+", #{@name}"}
  end
end

e = Example.new('Ricky')
['Hi', 'Hello', 'Goodbye'].map(&e)