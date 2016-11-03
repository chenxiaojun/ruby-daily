#将块封装为对象
block = ->(x, y){
  x + y
}

p block.call(3, 4)


block2 = proc{|x, y| x * y}
p block2.call(3, 5)