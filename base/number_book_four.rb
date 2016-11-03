a = 0.1 + 0.2
b = 0.3
p a == b #false


#由于float类的浮点小数是用2取幂后的倒数来表示，1/2  1/4     因此像1/5, 1/3这种就无法正确表示数值
e = 0.5 + 0.25
f = 0.75
p e == f #true

#要想正确处理这种无法转换为1 / 2 ** n的情况   可以先变成Rational对象
g = Rational(1, 10) + Rational(1, 5)
h = Rational(3, 10)
p g == h #true

c, d = 0.3, 0.3
p c == d #true

def dice
  arr = []
  10.times { arr << Random.rand(1..6)}
  arr
end
puts dice.inspect

def prime?(num)
  return false if num == 0 || num == 1
  flag = true
  2.upto(num) do |i|
    next if i == num
    if num.modulo(i) == 0
      flag = false
      break
    end
  end
  flag
end

(1..20).each {|i| p "#{i}是素数" if prime?(i) }