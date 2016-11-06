time_now = Time.new
time_now_two = Time.now
p time_now #2016-11-07 00:13:51 +0800
p time_now_two #2016-11-07 00:13:51 +0800


t = Time.now
p t.year   #2016
p t.day    #7
p t.month  #11
p t.hour
p t.yday
p t.mday
p t.wday
p t.zone

require 'time'
p Time.now.rfc2822

require 'date'
d = Date.today
p d.year
