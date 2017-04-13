require 'pry'

class A
  # A
  def hello
    puts "hello world"
  end
end

a = A.new

binding.pry

puts 'program resumes here'