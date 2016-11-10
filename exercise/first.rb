# 1,显示“hello world”
# 2,显示3+2-5的结果
# 3,“hello world"转换为大写
# 4,写一个add加法函数，参数a、b
print "hello world\n"

p 3+2-5

p 'hello world'.upcase

def add(a, b)
  a + b
end
p "4 + 5 = " + add(4,5).to_s


# 5 计算1到10的累加
# 6 列表1..10中的每项乘2
# 7 检查字符串tweet是否包括单词
# words = ["scala", "akka", "play framework", "sbt", "typesafe"]
# tweet = "This is an example tweet talking about scala and sbt."
sum = 0
[*1..10].each{|i| sum += i}
p sum

eval [*1..10].join('+')

p [*1..10].reduce(:+)

p [*1..10].map{|i| i * 2}
p (1..10).map{|i| i * 2}

words = ["scala", "akka", "play framework", "sbt", "typesafe"]
tweet = "This is an example tweet talking about scalas and sbt."

#解法一
$flag = false
words.each do |word|
  if Regexp.new('\s+'+word+'\s+') =~ tweet
    $flag = true
    break
  end
end

p $flag ? '包含' : '不包含'

#解法二
p (tweet.split & words).empty? ? '不包含' : '包含'

#解法三  这个和上面实现有一点不同的是，如果字符串里面只要有words里面这个单词 就返回true   不会去检查字符串里面的单词是否就是words里面的
p words.any? {|word| tweet.include?(word)} ? '包含' : '不包含'


p (1..10).class  #Range
p [*1..10].class #Array




