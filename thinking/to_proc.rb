class Symbol  # reopen Symbol class to reimplement to_proc method
  def my_to_proc
    ->(object) { object.send(self) }
  end
end

my_lambda = :to_s.my_to_proc

puts my_lambda.(1)  # prints '1'; .() does the same thing as .call()
puts my_lambda.(1).class  # prints 'String'

puts [4,5,6].map(&:to_s)  # prints "4\n5\n6\n"
puts [4,5,6].map(&:to_s).first.class  # prints 'String'


class Symbol
  def to_proc
    proc do |obj|
      puts "Symbol proc: #{obj}.send(:#{self})"
      obj.send(self)
    end
  end
end

class Array
  def map(&block)
    copy = self.class.new
    self.each do |index|
      puts "Array.map:   copy << block.call(#{index})"
      copy << block.call(index)
    end
    copy
  end
end

remapped_array = [0, 1, 2].map &:to_s
puts "remapped array: #{remapped_array.inspect}"
