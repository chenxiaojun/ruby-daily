block1 = Proc.new{ |x| x + 1 }
block2 = proc{ |y| y + 1 }
block3 = lambda{ |z| z + 1 }
block4 = ->(u){ u + 1}

p block1.call(5)   # 6
p block2.call(7)   # 8
p block3.call(4)   # 5
p block4.call(3)   # 4


block5 = proc{ |*args| args.map{ |item| item ** 2 } }
p block5.call(2,4,6)



p '---------------******---------------'

def power_of(n)
  lambda do |x|
    return x ** n
  end
end

block = power_of(3)
p block.call(4)


def power(i)
  p = proc{return i}
  p.call
end


block = power(5)
p block


def power2(i)
  proc{i}
end
p power2(6).call

def power4(i)
  def power5
    # p =proc{return i} #error
    p =proc{return 'hello'} #error
    p.call
  end
  power5
end
p power4(9)

def power3(i)
  proc{return i}
end
# p power3(7).call  #程序运行完power(3) 就相当于proc{return i}外层的方法消息，没有power3方法上下文，所以报错

p '---------------******--------------'

def prefix(ary, obj)
  result = []
  ary.each do |item|
    result << item

    if item == obj
      return result
    end
  end

  result = 2345
end

p prefix([1, 2, 3, 4, 5], 3)


p '---------------******--------------'

#非lambda的  都会从当前的方法返回
['a', 'b', 'c'].each do |t|  #unexpected return (LocalJumpError)
  return t
end


# proc 中 如果使用return   程序会跳出当前块， 直接从创建这个块的方法返回  所以这里找不到上下文  报错
# b = proc{return 123}
# p b.call











