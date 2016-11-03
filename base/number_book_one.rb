# Ruby 可以直接计算分数

#计算 1/3 + 2/5
p Rational(1, 3) + Rational(2, 5)   # 11/15

p Rational(2, 3) / Rational(4, 7)   # 6/7

p Rational(1, 4).to_f #0.25



#Rational 计算有理数      Complex计算复数
p Complex(2, 5)  #  2+5i
p Complex(2, 1) ** 2  # 3+4i    Complex(实数， 虚数)



#8进制以0或0o开头      16进制以0x开头    10进制以0d开头    2进制以0d开头

p 5 ** -2   #1 / 25
p 5 ** -2.0


#div方法返回商的整数部分， 如果是正的则向上取整，负的向下取整。
p 5.div(2.4)  #2
p -5.div(2.4) #3
p 5.div(-2.4) #3

#x.quo(y)  返回x除以y的商， 如果x，y都是整数，则返回Rational对象，否则返回小数
p 5.quo(3.4) #1.4705882352941178
p 5.quo(-8)  #-5/8

p 1 + Rational(1, 4)  #5/4
p 1.2+Rational(1, 4)  #1.45

#x.modulo(y)  与 x % y等价
p 5.modulo(2)  # 1

p -5.modulo(-2)  # -1

#x.divmod(y) 将x除以y后的商和余数作为数组返回。 商是x/y的结果去掉小数点后的部分而得到的值，余数符号和y一致。
p 5.divmod(-2)   # -3 -1

#与modulo相反   x.remainder(y) 返回x除以y的余数，符合和x保持一致
p -5.remainder(2)  #-1


#求平方根
p Math.sqrt(4) #2.0

#圆周率
p Math::PI #圆周率
p Math::E  #自然对数的底数
p Math.log2(4)#2.0

#round 四舍五入   ceil 向上取整    floor向下取整
p 3.5.round #4
p 3.5.ceil  #4
p 3.5.floor #3