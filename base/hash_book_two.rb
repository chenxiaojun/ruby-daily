#我们可以一次性获取hash的key 和 value
example = {name:'ricky', age:20, hobby:'ruby'}

puts example.keys.inspect #[:name, :age, :hobby]
p example.values  #["ricky", 20, "ruby"]


#迭代器形式获取key  value
keys = []
example.each_key do |key|
  keys << key
end

values = []
example.each_value {|val| values << val}

p keys
p values


#对hash  使用to_a 方法
p example.to_a   #[[:name, "ricky"], [:age, 20], [:hobby, "ruby"]]
k, v = [], []
example.to_a.each do |key, val|
  k << key
  v << val
end
p k
p v

p example
#判断某个元素是否是散列的键
p example.has_key?('name') #false
p example.has_key?(:name) #true
p example.key?(:age) #true
p example.include?(:hobby) #true
p example.member?(:age) #true

#查看散列中是否有某个值
p example.value?('ricky') #true
p example.has_value?('ruby') #true


#查看散列的长度  判断散列是否为空
p example.length
p example.size
p example.empty?