#ruby 的方法分实例方法  类方法   和函数式方法(没有接收者的方法  sleep(2))

class A
  @@name = 'a'
end
p A::name
p A.name  #类方法的两种访问形式


#如果方法参数个数不确定的情况
def func(a, *b, c)
  [a, b, c]
end


result = func(1, 2, 3, 4, 5, 6)    # [1, [2, 3, 4, 5], 6]
p result.inspect

#所以对于方法参数不确定的  可以使用 *params 的形式来接收



#ruby强大在  还可以将一个形参以数组的方式   传递给一个方法，方法以单个变量去接收这个参数
def more_fun(a, b, c)
  [1, a, b, c]
end

args = [3,4,5]
p more_fun(*args)



#关键字参数
def func(x:8, y:1)
  x + y
end
p func  #9  所以确实可以这样指定。



#ruby 传入散列的时候， 可以省去{}
def hash_func(arg1, arg2)
  p arg2
end

hash_func('hehe', a:4, b:5)
