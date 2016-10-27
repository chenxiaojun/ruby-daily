def f0
  p = Proc.new{ return 0 }
  p.call
  1
end

def f1
  p = proc{ return 0 }
  p.call
  1
end

def f2
  l = lambda{ return 0 }
  l.call
  1
end

p f0 #0
p f1 #0   proc遇到return终止当前所在的作用域
p f2 #1   lambda遇到return时候终止块里面的作用域

def f3(p)
  instance_eval &p
  1
end

class A
end

def f4(p)
  A.class_eval &p
  1
end

p1 = Proc.new{}
p2 = proc{}
l  = lambda{}

# p f3(p1)   #1
# p f3(p2)   #1
# p f3(l)   #异常   说明lambda不能完美的转换为块


#参数检查 proc  Proc.new  yield都不检查    而lambda ->都检查很严格


#proc在行为上更趋近于block     lambda其实是方法，只不过是匿名的
def example_one
  return 0     #这个就是proc的意味
  1
end

def example_two
  def __f1     #这个就是和lambda的意味
    0
  end
  __f1
  1
end


#proc中 return 能记住proc生成时block的位置， 所以无论proc在哪里，都会从proc所在的作用域开始执行return
def example_three(p)
  p.call
  1
end

def example_four
  Proc.new{return 0}
end

def example_five
  ->{return 0}
end

four = example_four
five = example_five

p example_three(five)     #1
#p example_three(four)    #这个会报异常  block in example_four': unexpected return (LocalJumpError)


block = ->(arg1, arg2){ arg1 * arg2 }
p block.call(5, 6)








