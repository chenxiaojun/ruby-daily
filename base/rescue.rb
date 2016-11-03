#Ruby 使用 begin~rescue~end语句描述异常处理
begin
  i = 0
  res = 1 / i
rescue
  p $@.to_s+'   '+$!.message
  p $!.class
end

p '------*------'

#表达式1 rescue 表达式2
#上面等价于下面
#begin
#表达式1
#rescue
#表达式2
#end
n = 1 / 0 rescue '数据异常'
p n


p '------*------'
i = 1
begin
  1 / 0
rescue
  p 'haha'
  i += 1
  retry unless i > 5   #retry 会去执行begin下面的块内容
end


#如果整个方法体里面都是被begin...end包括的话，那么我们可以省略begin...end  直接写rescue..ensure部分
def test(i)
  n = 6 / i
rescue
  i += 2
  retry
ensure
  p n
end

test(0)


p '-------*--------'

class A
  def haha
    puts 'haha'
  end
end


B = Class.new(A)   #等价于 B < A
B.new.haha