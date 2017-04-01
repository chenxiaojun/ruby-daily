module B
  def self.included(base)
    base.extend ClassMethods
    base.class_eval do
      # scope :disabled, -> { where(disabled: true) }
      def disabled
        'disabled'
      end
    end
  end

  module ClassMethods
    def test
      'test'
    end
  end
end

class A
  include B
end

puts A.test
puts A.new.disabled

