#在Ruby中， 定义一个代码块方式有2种， 一是使用do...end，另外一种是用"{}"把代码内容括起来。
#代码块定义的时候是可以接收参数的。 但是只有在调用一个方法时候才可以定义一个块

#块定义好后， 会直接传递给调用的方法， 在该方法中，使用yield关键字即可回调这个块。

def block_method(a, b)
  a + yield(a, b)  #14
end

puts block_method(3, 8){|x, y| x+y}

result = block_method(1, 2) do |a, b|
  a+b*2
end
puts result  #6


#如果一个方法定义的时候使用yield关键字，但是调用的时候没有传递代码块，方法会抛出"no block given (yield)"异常
#可以使用Kernal # block_given?  方法来检测是否可以包含代码块

def check_block
  return yield if block_given?
  'no block'
end

puts check_block{'This is a block'}    #This is a block
puts check_block #no block


#代码块是由代码和一组绑定组成，代码块可以获得自己定义的局部变量的绑定。 和上下文可见的实例变量，在代码块执行的时候
#只会根据自己定义时可见的绑定来执行，业界把块这样的特性称之为闭包。
def closure_method
  x = 'Goodbye'
  yield('ricky')
end
x = 'Hello'
puts closure_method{|y| "#{x}, #{y}"}   #Hello, ricky