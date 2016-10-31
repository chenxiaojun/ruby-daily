#eval函数接受一个字符串类型作为参数， 将其解析成语句并混合在当前作用域内运行。
#下面这段代码  可以接受我们的指定， 通过ruby的解析器去执行这个指定。 所以如果运行在实际项目中，会很危险。
# loop do
#   print "Expression: "
#   puts "result: #{eval gets.chomp}"
# end

#gets中包含了 "\n"   而gets.chomp中不包含"\n"
#chomp方法是移除字符串尾部的分离符， 例如：\n \r    而gets默认的分离符是\n


POSSIBLE_VERBS = ['get', 'put', 'post', 'delete']
POSSIBLE_VERBS.each do |m|
  eval <<-end_val
    def #{m}(args)
      args+", Ricky!"
    end
  end_val
end

p get("Hello")


