arr = ['a', ['b', 'c'], 1]

arr.each do |a|
  case a
  when String
    p 'yes'
  when Array
    p 'no'
  else
    p 'bubu'
  end
end



p 'yes' if Array === arr    #三等于意义作用更广， 可以 判断值是否相等， 值是否属于某个类， 值是否符合某个正则。