#定义带块的方法
def example_one(x, y)
  arg = x << y
  while true
    yield(arg)
  end
end

times = 1

a, b = 'Hello', ' Ricky'
example_one(a, b) do |t|
  puts "#{times} #{t}"
  break if times % 3 == 0
  times += 1
end


for i in 1..6
  if i == 3
    next   #重新循环一轮 下面的不执行
  end
  p i
end


['a', 'b', 'c'].each do |val|
  if val == 'a'
    next
  end
  p val
end

p '----------------'
i = 0
['a', 'b', 'c'].each do |v| #redo 会重新从代码块开头处再来一次
  p v
  if v == 'b'
    i += 1
    redo if i < 3
  end
end
