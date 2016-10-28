class A
  def example_one
    'a'
  end
end

class B < A
  undef :example_one
end

p B.new.example_one