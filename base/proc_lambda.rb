#Ruby中所有的可调用对象，最后都是一个Proc对象
#lambda 和  Proc 主要不同点

#1, return关键字， lambda中，return会结束当前lambda  而proc中，则会结束当前作用域继续执行
#2, 参数校检： lambda 参数个数不对就会报错， proc中参数多少它都可以自己调整


def proc_method
  p = proc{return 10}
  result = p.call
  result*2
end

def lambda_method
  p = lambda{return 10}
  result = p.call
  result*2
end

p proc_method   #10
p lambda_method #20