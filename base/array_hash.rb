types = ["金", "木", "水", "火", "土"]

names = []

p types[2]
p names[1]  #空数组如果输出一个不存在的键  不会报错，返回的是nil


names[2] = '哈哈' #向数组里面添加或覆盖元素
p names
p names.size  #3 空的nil 也会开辟一个空间长度



types.each do |type|
  print "type "     #这个里面的称为块
end
print "\n"


mixed = [1, 'string', ['hah'], :book]   #数组里面可以存很多其它类型的数据
p mixed

p '--------------------------------------'
=begin
散列：散列就是其它语言里的关联数组， 它和数组不同的是它有自己对应的键，然后跟上值   一般是以 字符串 或 symbol作为键。
     使用 to_s  可以将字符串  转为  symbol
     使用 to_sym 可以将 symbol 转为 字符串
=end

address = {name: "Ricky",
           age: 24,
           address: "shenzhen",
           :hobby => "computer"}
p address
p address[:name]
p address[:hobby]

#散列的遍历方法，  如果do后面的只写val，那么对应的将是一个键值对。  如果加了key 那么就分开了。
address.each do |key, val|
  print key,'-',val,"\n"
end







