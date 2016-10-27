class Person
  def method_missing(arg, &block)
    "#{arg} is not found in #{self}"
  end

  def name
    "My name is Ricky"
  end
end

p = Person.new
#p p.hobby   #  undefined method `hobby' for #<Person:0x007fc2f2108cb0> (NoMethodError)
p p.hobby

