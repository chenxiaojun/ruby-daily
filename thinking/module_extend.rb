class Person
  def wear
    '穿衣'
  end
end

class Economist < Person
end

economist = Economist.new
p ("1: "+economist.wear)   #1: 穿衣



module Professor
  def wear
    "戴眼镜"
  end
end
class Economist < Person
  include Professor
end
p ("2: "+economist.wear)  #2: 戴眼镜

module Professor
  def wear
    "#{super}, 戴眼镜"
  end
end
p ("3: "+economist.wear) #3: 穿衣, 戴眼镜


module Expert
  def refute_rumor
    '辟谣'
  end
end

module Professor
  include Expert
end

#p ("4" + economist.refute_rumor)  #异常

Economist.include Professor
p ("4: " + economist.refute_rumor)  #4: 辟谣