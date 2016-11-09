block1 = ->(x, y){x ** y}
block2 = proc{|x, y| x + y}
block3 = Proc.new{|x, y| x * y}
block4 = lambda{|x, y| x.modulo(y)}

p block1.call(2, 4)
p block2.call(2, 4)
p block3.call(2, 4)
p block4.call(2, 4)

#diffence

#1, 参数检查  lambda比较严格  个数不对等就会报错，  而proc会自己调节
p block3.call(4, 3, 6)
p block2.call(4, 3, 6)

p '--'
# p block1.call(4, 3, 6)
# p block4.call(4, 3, 6)

#2，内部使用return的时候   proc, Proc会从当前所在的方法跳出，   return只是从内部跳出

block6 = ->{return 'hi'}
block5 = proc{return 'hello'}

p block6.call
# p block5.call #unexpected return (LocalJumpError)



#to_proc方法
p ['a', 'b', 'c'].map(&:capitalize)
