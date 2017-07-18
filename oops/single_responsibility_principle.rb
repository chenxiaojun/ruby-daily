# 单一职责的类
# 一个类应该尽可能做最小用途的事， 也就是说它应该具有单一职责
# cog 碟子，盘子，这里指飞轮    chainring 链式，这里是牙盘    齿轮牙数比率： chainring/cog   gear 齿轮

# class Gear
#   attr_reader :chainring, :cog
#
#   def initialize(chainring, cog)
#     @chainring = chainring
#     @cog = cog
#   end
#
#   def ratio
#     chainring / cog.to_f
#   end
# end
#
# p Gear.new(52, 11).ratio
# p Gear.new(30, 27).ratio

# 假如现在我们的飞轮和牙盘数相同的齿轮，但是他们因为轮胎和钢圈直径不同会导致有点不一样，我们希望改进这个类
# 重新打开
# class Gear
#   attr_reader :chainring, :cog, :rim, :tire
#
#   def initialize(chainring, cog, rim, tire)
#     @chainring = chainring
#     @cog = cog
#     @rim = rim
#     @tire = tire
#   end
#
#   # 计算齿轮牙数比率
#   def ratio
#     chainring / cog.to_f
#   end
#
#   # 计算直径
#   def diameter
#     rim + tire*2
#   end
#
#   # 计算齿轮英寸数
#   def gear_inches
#     # 轮胎乘2 + 钢圈直径
#     diameter * ratio
#   end
#
#   #计算自行车周长
#   def circumference
#     diameter * Math::PI
#   end
# end
#
# puts Gear.new(52, 11, 26, 1.5).gear_inches
# puts Gear.new(52, 11, 24, 1.25).gear_inches


# 单一职责
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    wheel.diameter * ratio
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

wheel = Wheel.new(26, 1.5)
puts Gear.new(52, 11, wheel).gear_inches
puts wheel.circumference
puts Gear.new(52, 11).ratio