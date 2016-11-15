require 'redis'
require 'json'
#this assumes redis was start with a default configuration
#listening on localhost, port 6379
#redis = Redis.new

#specify connection
#redis = Redis.new(:host => '127.0.0.1', "port" => 6379, "db" => 2)

#you can also specify connection options as follow
# redis = Redis.new(:url => "redis://127.0.0.1:6379/1")
# p redis ##<Redis client v3.3.1 for redis://127.0.0.1:6379/0>
#
# #set 存储一个键值对  如果这个键已经存在，那么会覆盖掉原有的值. 如果不存在，则创建之
# redis.set('name', 'micky')
# redis.set('address', 'beijing', ex:10)
# p redis.get('name')
# p redis.get('address')

redis = Redis.new(:host => '127.0.0.1', "port" => 6379, "db" => 2)
val = ['Hello', 'world']
redis.set('key', val)

val2 = ['Hello', 'world'].to_json
redis.set('name', val2)


redis.set('test1', {name:'ricky', age:22})
redis.set('test2', {name:'ricky', age:22}.to_json)



p a = redis.get('key')   #"[\"Hello\", \"world\"]"
p b = redis.get('name')  #"[\"Hello\",\"world\"]"
p c = redis.get('test1') #"{:name=>\"ricky\", :age=>22}"
p d = redis.get('test2') #"{\"name\":\"ricky\",\"age\":22}"



#假设我们现在想读取具体数据  name  test2这种就可以很好的转换回来
p e = JSON.parse(b)
p f = JSON.parse(d)

p e[0]
p f["name"]

p '---------------------------'

#pipelining
#当很多的命令需要连续执行，且这些命令都是独立的，没有任何依赖关系，那么我们可以使用这个命令
#也就是说客户端不会去等待某一个命令执行完再去执行下一个，块里面的命令可以在同一刻大量执行

redis.pipelined do
  redis.set 'car', 'ceshi'
  redis.set 'car', 'ceshi2'
  redis.set 'car', 'ceshi3'
  redis.set 'car', 'ceshi4'
  redis.set 'car', 'ceshi5'
  redis.incr 'haha'
end






