require 'active_record'

#公共文件连接数据库
ActiveRecord::Base.establish_connection(
    adapter:'mysql2',
    username:'root',
    password:'',
    database:'ricky',
    host:'127.0.0.1')

class User < ActiveRecord::Base
  scope :search_ricky, ->{ where(name: 'Ricky') }

  def self.search_micky
    where( name: 'Micky' )
  end
end

#然后就可以使用active record提供的一些方法操作数据库了
#使用Model.find(primary_key) 可以获取指定主键对应的对象  返回的是一个ActiveRecord::Relation 实例
u = User.find(2)  #<User id: 2, name: "Micky", hobby: "Ruby", created_at: "2016-11-14 05:20:25", updated_at: "2016-11-14 05:20:25">
p u
p u.name
p u.class #User(id: integer, name: string, hobby: string, created_at: datetime, updated_at: datetime)
#p u.find(10086) #NoMethodError   如果找不到他会抛出一个异常


#take方法  会获取一个记录, 不考虑顺序
u = User.take
p u ##<User id: 1, name: "Ricky", hobby: "computer", created_at: nil, updated_at: nil>
#如果没找到记录  model.take不会抛出异常， 而是返回nil  所以用它判断数据是否存在就很好了


#first    获取按主键排序得到的第一个记录, 如果找不到不会抛出异常，而是返回nil
u = User.first
p u


#last 获取按主键排序得到的最后一个记录， 如果找不到，不会抛出异常 返回nil
u = User.last
p u

#find_by 获取满足条件的第一个记录  如果没有找到，返回nil
u = User.find_by(hobby: 'Ruby', name:'Micky')  #多个条件 是并且的关系
p u

# 综上，只有find找不到的时候会抛出异常，其它的都不会，如果想让他抛异常，那么后面加  !就可以了   take!

p '-------------获取多个记录----------------'

ids = [1, 2]
u = User.find(ids)   #find还可以传多个主键id组成的数组，那么就会返回找到的所有记录， 需要注意的是如果里面有一个id找不到，那么会抛出异常
p u

# take 的参数代表要取出的记录数
u = User.take(2)
p u

p User.first(2)
p User.last(2)



p '----------------批量获取多个对象--------------'

u = User.all  #获取所有的记录数

#假设现在我们需要对报名的用户进行短信下发,如果一次读取整个表，那么内存可能吃不消。
User.all.each_with_index { |val, key| print key.to_s + ': '; p val }

#分批获取  现在的就是一个进程从ID为1的地方开始  每次取1个进行发送
User.find_each(start: 1, batch_size: 1) do |user|
  p user
end


p '----------多个worker----------'
#假设我们想用多个worker  进行分批发送这个任务 可以设置start每次的起始值
count = User.count
start = 0
size = 2
#现假设我们想要从id为1的地方开始  每次发送2个人
while count
  break if count <= 0

  User.limit(size).offset(start).each do |uu|
    p count.to_s + ': ' + uu.name
  end

  if count <= 2
    break
  end

  #说明还要分批  减去发出去的2条  开始的位置加2
  count -= 2
  start += size
end


p '-----------通过制定条件查询-------------------'

#where 从句
u = User.where("name = ? AND hobby = ?", 'Ricky', 'computer')
u2= User.where("name = ? AND hobby = ?", 'Ricky', 'computer2')
p u ##<ActiveRecord::Relation [#<User id: 1, name: "Ricky", hobby: "computer", created_at: nil, updated_at: nil>]>
p u2 ##<ActiveRecord::Relation []>
p u2.take.nil?  #true



#hash 条件   hash只能指定相等。 范围和子集这三种条件
p User.where(name: 'Micky')
#如果是两个表关联，  还可以在where里面制定表名+条件
#User.joins(:tests).where(tests: {name: 'Ricky'})

#范围   查询某天到某天就好处理了  而且还可以带多个where
p User.where(created_at:(Time.now.midnight)..Time.now).where.not(name:'Geek')

#如果想要in子句， 可以在hash中使用数组
p User.where(name:['Ricky', 'Geek', 'haha']) #find只能用id  这个就没有限制了  而且如果不存在不会报异常


#有时候我们想使用not语句  表示不在某个范围   可以用where.not
p User.where.not(name:['Ricky', 'Geek'])

p '--------------更多查询相关----------------'

#排序
p User.order(id: :desc, created_at: :asc)


#查询指定字段
p User.select('name').order(id: :desc)
#如果希望同一记录只出现一次  使用distinct
p User.select('name').distinct.order(id: :desc)



#限量与偏移
#limit offset
p User.limit(2).offset(1)  #从下标为1的地方开始 取出2条数据

#类似的还有group   having  unscope->删除某个条件   .unscope(:order)


p '----------类中定义方法------------'
p User.search_ricky
p User.search_micky


p '---------------动态方法-----------------'
#动态查询方法
#Active Record为数据表中的每个字段提供了一个查询方法   例如： 在Client模型中有个first_name
#那么Active Record就会生成find_by_first_name方法
p User.find_by_name('Ricky')
p User.find_by_hobby('Ruby')
p User.find_by_id(3)


#查询不到的时候  创建一个新的记录
p User.find_or_create_by(name:'Haha')



#pluck
#pluck 方法可以在模型对应的数据表中查询一个或多个字段，  参数是一组字段名， 返回一个数组
p User.pluck(:id)   #[1, 2, 3, 4]
p User.pluck(:id, :name)

p User.select(:id).map(&:id)

p '----------------ids----------------'

p User.ids  #[1, 2, 3, 4] #获取数据表的主键



#检查对象是否存在   只要有一个记录存在   就返回true

p User.exists?(2)  #true
p User.exists?(5)  #false

p User.exists?(name: ['Ricky']) #true
p User.exists?(name: ['ricky', 'Geek']) #true
p User.exists?(hobby: 'Ruby') #true

p User.where(name: 'Ricky').count
p User.count(:name)



