class F
  def self.inherited(params)
    puts "**#{params}**"
  end
end

class A < F
  class << self
    def inherited(base)
      super
      puts "#{base} is inherited from #{self}"
    end
  end

  def name
    puts 'Hello, Ricky!'
  end
end

class B < A
end
