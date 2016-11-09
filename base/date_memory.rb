#获得当前时间
p t = Time.now  #2016-11-09 11:22:58 +0800
p t.wday
p t.mday
p t.yday

p t.to_i
p t.hour
p t.min
p t.sec
p t.usec

p t.wednesday?

p t.getlocal

p t.eql?(t.getlocal)
p t.eql?(t.localtime)

p t.to_f


p '----------****-----------'
#格式化时间
p Time.local(2016, 11, 9)
p Time.local(2016, 11, 9, 12, 56, 60)
p Time.mktime(2016, 11, 9, 12, 56, 12)  #按照当前时区创建时间

second = Time.now.to_i
p second
p Time.at(second + 3600*24)  #将时间戳转化为具体时间对象

p Time.now.ctime


require 'date'
p Date.new(2016, 11, 9).cweek  #11月9号是一年的第多少周
#p Date.new(2016, 11, 9)  #<Date: 2016-11-09 ((2457702j,0s,0n),+0s,2299161j)>
date = Date.new(2016, 11, 9)
tomorrow = date + 1
yesterday = date - 1
last_month = date << 1
next_month = date >> 1

p tomorrow.to_s
p yesterday.to_s
p last_month.to_s
p next_month.to_s


#判断某年是否是闰年
p tomorrow.leap?



def is_lead?(year)
  Date.new(year).leap?
end

p is_lead?(2012)
p is_lead?(2011)

p Date.new(Time.now.year, Time.now.month, Time.now.day).leap?