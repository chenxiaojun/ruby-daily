arr = [1, 2, 3, [4, 5], 6]

# arr.flatten  [1, 2, 3, 4, 5, 6]
# how do you implement flatten method?

flat = []
arr.each do |item|
  if item.is_a? Array
    item.each { |i| arr << i }
  else
    flat << item
  end
end

p flat

arr = [1, 2, 3, [4, 5], 6]
container = []
# Version 2
until arr.empty?
  thing = arr.pop

  if thing.is_a? Array
    thing.each { |i| arr << i }
  else
    container << thing
  end
end

p container


arr = [1, [5, [3, 7]], 3, [4, 5], 6]

class Array
  def my_flatten
    params = self
    container = []
    until params.empty?
      thing = params.pop
      if thing.is_a? Array
        thing.each { |i| params << i }
      else
        container << thing
      end
    end
    container.reverse!
  end
end

p arr.my_flatten


