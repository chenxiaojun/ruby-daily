#ruby 中的类都是开放的  也就是我们可以随时打开添加删除覆写方法
#比如我们像系统的String类里追加一个 统计字符串中单词数的方法

class String
  def count_words
    array =self.split(/\s+/)
    array.size
  end
end


size = "I am Ricky".count_words
p size #3


p '---------*----------'

class RingArray < Array
  def [](i)
    idx = i % size
    super(idx)
  end
end
wday = RingArray['日', '月', '火', '水', '木', '金', '土']
p wday[6]
p wday[16]


p RingArray.instance_methods







