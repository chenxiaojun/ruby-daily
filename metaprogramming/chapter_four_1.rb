#代码块
def block(a, b)
  a + yield(a, b) if block_given?
end

p block(2, 6){|x, y| x ** y} #66


#代码块可以获得局部变量，并一直绑定他们
def just_yield
  p  'haha'
  yield
end

top_level_variable = 1

just_yield do
  top_level_variable += 1
end

p top_level_variable  #2



a = 1
lambal = ->{a = 7}
lambal.call
p a  #7   所以块的作用域和它当前所在的位置有关，并能影响到他所在的作用域

