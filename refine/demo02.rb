module A
  refine String do
    def reverse
      'I love Ruby'
    end
  end
end

using A

class String
  def test
    reverse
  end
end