#哈希可以和数组  一样使用delete delete_if  reject去删除某个元素
example = {name:'ricky', age:20, hobby:'ruby'}

#返回被删除的值
new_hash = example.delete(:name)  #{:age=>20, :hobby=>"ruby"}
p example
p new_hash


example = {name:'ricky', age:20, hobby:'ruby'}
example.delete_if {|x| x == :age}
p example


#使用clear清空一个散列
example.clear
p example

wday = {sunday:'星期日',
        monday:'星期一',
        tuesday:'星期二',
        wednesday:'星期三',
        thursday:'星期四',
        friday:'星期五',
        saturday:'星期六'}

wday.to_a.each do |k, v|
  print sprintf("\"%s\" 是%s。\n", k, v)
end


def str2hash(str)
  container = Hash.new
  arr = str.split(/\s+/)
  while(key = arr.shift)
    val = arr.shift
    container[key] = val
  end
  container
end

p str2hash("name ricky\n age 23")