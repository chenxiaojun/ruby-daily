#由于method_missing是存在于BasicObject类里面的一个私有方法，当方法找不到的时候会去调用它
#所以我们可以在自己的类中去覆写这个方法，完成想要的功能。
class Lawyer
  def method_missing(method, *args)
    puts "You called: #{method}(#{args.join(', ')})"
    puts "You have set a block" if block_given?
  end
end

l = Lawyer.new
l.talk_simple('a', 'b') do
  # a block
end

p '------------------------'

#method_missing
class BuyCoffee
  def method_missing(name, *args)
    person = name.to_s.capitalize
    p person
    #如果所属方法不存在，那么回归到BasicObject里面接着调用 method_missing方法
    super unless %w(Ricky Micky).include? person
    number = 0  #这里不加，会导致程序陷入死循环，因为在 got a #{number}中，程序不知道number是一个变量，并当做一个方法调用了
    3.times do
      number = rand(10) + 1
      puts "#{number}..."
    end
    "#{person} got a #{number}"
  end
end

obj = BuyCoffee.new
puts obj.ricky
puts obj.Micky
puts obj.kitty