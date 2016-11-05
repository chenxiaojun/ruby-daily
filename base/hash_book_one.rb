person = Hash.new

person[:name] = 'ricky'
puts person


test = Hash.new
puts test['key']  # nil

test2 = Hash.new(0)
puts test2['key'] # 0


#hash 还可以使用store方法设定值
test2.store('hobby', 'ruby')
puts test2.inspect
test2.store('hobby', 'php')
puts test2.inspect


#hash 还可以使用fetch 获取值
puts test2.fetch('hobby')

#fetch方法和[]不同的是 如果fetch不存在的key时会抛出异常
puts test2['china']  #nil
# puts test2.fetch('china') #:in `fetch': key not found: "china"


#如果我们给fetch指定第二个参数   那么当fetch一个存在的值  时会使用第二个参数充当默认的值
puts test2.fetch('china', 'mylove')  #mylove
puts test2.fetch('hobby', 'mylove')  #php


