#块经常被用来在数组排序之sort方法中实现自定义排序
arr = ['ruby', 'PHP', 'Python', 'Java']
print arr.sort
p ''
print arr.sort{|obj1, obj2| obj1 <=> obj2}
p ''
print arr.sort{|obj1, obj2| obj1.length <=> obj2.length}
p ''
p 1<=>3




#
target = %w(My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa)
times = 0
t3 = Time.now.usec
sorted = target.sort do |o1, o2|
  times += 1
  o1.length <=> o2.length
end
t4 = Time.now.usec - t3
puts sorted.inspect
puts times
puts t4


p '----*-----'

target2 = %w(My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa My hobby is Ruby How about you Can you tell me ha haha haha hahaa)
times2 = 0
t3 = Time.now.usec
sorted2 = target2.sort_by do |obj|
  times2 += 1
  obj.length
end
t4 = Time.now.usec - t3
puts sorted2.inspect
puts times2
puts t4

#很明显第二种方法执行的更快， 执行的次数更少