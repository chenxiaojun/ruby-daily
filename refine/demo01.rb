module A
  refine String do
    def inspect
      'bug'
    end
  end
end

puts 'Ruby'.inspect # Ruby
using A
puts 'Ruby'.inspect # bug