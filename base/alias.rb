class C1       #定义C1类
  def hello    #定义hello方法
    'Hello'
  end
end

class C2 < C1
  alias old_hello hello

  def hello
    "#{old_hello}, again"
  end
end


obj = C2.new
p obj.old_hello
p obj.hello


# alias 可以给已经存在的方法设置别名。
# alias 别名 原名
# alias :别名 :原名

class C3
  def test
    p 'Haha'
  end

  alias :demo :test
end

C3.new.demo