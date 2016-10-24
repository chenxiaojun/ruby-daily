str = "haha"
puts str.object_id

str = "hehe"
puts str.object_id    #说明这种赋值的方法   它会清除原来对象的空间，然后创立一个新的对象

str2 = str            #说明这种赋值方法     产生的对象还是原来的对象
puts str2.object_id


str2 = "buhao "
puts str2.object_id


str3 = "hello"
str4 = "hello"
puts str3.eql? str4   #eql  判断值是否相等
puts str3.equal? str4 #判断  是否是同一个对象
puts str3 == str4     #判断值是否 相等
puts str3 === str4   #判断是否相等， 值相等？ 右边是否是属于左边的一个对象   还可以用于模式



puts 1 == 1.0
puts 1 === 1.0
puts 1.eql? 1.0 #false   数字型的 eql除了判断值  还会判断类型
puts 1.equal? 1.0


puts 1 == "1.0"#false
puts 1.eql? "1.0"#false