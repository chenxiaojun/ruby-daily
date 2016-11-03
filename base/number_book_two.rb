#按位取反
p ~2
p ~(-2)

#操作数每右移一位  相当于把该数除以2   >>
#操作数每左移一位  相当于把该数乘以2   <<
p 16 >> 3
p 3 << 4

#随机数
p Random.rand   #不指定参数     返回比1小的浮点数。   参数为正整数，返回0到该正整数之间的数
p Random.rand(200)
p [Random.rand, Random.rand]
p Random.instance_methods

r1 = Random.new(1)
p [r1.rand, r1.rand]
