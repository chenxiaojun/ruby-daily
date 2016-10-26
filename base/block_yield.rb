def test
  puts "You are in the method"
  yield
  puts "You are back to the method"
  yield
end

puts 'start: '

test{puts "You are in the block"}



#pass parameters with the yield statement
def demo
  yield 5, 6
  puts "You are in the method demo"
  yield 100
end
demo{|i, j| puts "You are in the block #{i}, #{j}"}


#argument with &
def try(&block)
  block.call
end
try{puts "Hello World!"}

#BEGIN & END BLOCKS
BEGIN{
  puts "begin code block"
}

END{
  puts 'end code block'
}

puts "main code block"