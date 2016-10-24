=begin
正则表达式
语法： /模式/
=end
p /zx/ =~ "abcdefgh"    #nil
p nil.equal? false      #false
if /zx/ =~ "abcdefgh"   #条件为假  nil在ruby中为假，但是不等于 false
  p 'yes'
else
  p 'no'
end

a = 0
if a     #说明 0  在ruby中是 真
  p 'y'
else
  p 'n'
end

b = false  #false 也是条件假
if b
  p 's'
else
  p 'b'
end


kinds = ['赵', '钱', '孙', '李']
kinds.each do |k|
  p k if /李/ =~ k   #需要注意的是  模式里面不需要加引号
end

