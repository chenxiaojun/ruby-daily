#可调用对象  对代码块的调用分为2步
#代码打包 以备调用
#利用yield 调用代码块执行代码
#这种先打包后执行的策略  称之为  延迟策略

#代码块在Ruby中并不是一个对象， 但是， 如果你想把一个代码块保存为一个对象以供调用怎么办?
#Proc类->一个转换成对象的块      把一个块转换为Proc对象的方法有4种
#proc{...}    Proc.new{...}   lambda{..}   &操作符

proc1 = proc{ |x| x+1 }
puts proc1.class

proc2 = Proc.new{ |y| y+1 }
puts proc2.class

proc3 = lambda { |x| x+1 }
puts proc3.class

# & 操作符只有在方法调用时才有效, 在方法定义的时候，可以给方法添加一个特殊的参数，该参数必须是参数列表中的最后一个 且以&开头
  # 其含义就是， 这是一个Proc对象， 我想把它当做一个块来用，如果调用该函数时，没有传递代码块，那么该参数值为nil。 有了这个符号
  # 就可以很容易的把一个代码块转换为Proc对象，并在多个方法之间传递。
def my_method(&block)
  test(&block)
  block
end

def test
  puts yield(3) if block_given?
end

p2 = my_method{ |x| x+1 }  #4
puts p2.class  #Proc



def angel
  yield
  p '---'
  baby{p 'hi'}
  baby
end

def baby
  yield if block_given?
end

angel{ p 'hello'}

