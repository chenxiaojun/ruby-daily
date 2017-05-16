require 'active_record'
class Foo
  CONSTANT_VARS = [1, 3, 5]
  @@class_array = [4, 6, 7]

  def initialize
    @instance_array = [6, 3, 2]
  end

  delegate :sum, to: :CONSTANT_VARS
  delegate :max, to: :@@class_array
  delegate :min, to: :@instance_array
end

p Foo::CONSTANT_VARS

p Foo.new.max #7
p Foo.new.sum #9
p Foo.new.min #2
