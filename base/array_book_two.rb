a = %w|a b c d e f|
b = %w(c e g t y)
#求两个数组的交集
puts (a & b).inspect

#求两个数组的并集
puts (a | b).inspect
puts (a + b).inspect  # + 和 | 都是求并集   +不会去重复，| 会去

#求在a中  不在b中的元素集合
puts (a - b).inspect