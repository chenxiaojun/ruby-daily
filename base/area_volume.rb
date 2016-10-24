#计算长方体体积
length = 6
width = 2
height = 5

def calculator_area(length, width, height)
	2 * (length * width + width * height + length * height)
end

def calculator_volume(length, width, height)
	length * width * height
end

area 	= calculator_area(length, width, height)
volume  = calculator_volume(length, width, height)

puts "area = " + area.to_s  #104
puts "volume = #{volume}"   #60