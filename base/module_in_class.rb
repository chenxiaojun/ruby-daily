# module N
#   attr_accessor :v
#   def initialize
#     @v = 'hao123'
#   end
# end
#
# class C
#   include N
#   def initialize
#     super
#   end
# end
#
# c = C.new
# p c.v

module N
  attr_accessor :v
  def self.included(base)
    base.instance_eval do
      define_method :initialize do
        @v = 'hello'
      end
    end
  end
end

class C
  include N
end

c = C.new
puts c.v