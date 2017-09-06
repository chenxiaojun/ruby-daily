module Graphics
  module Conversions
    module_function
    def Point(*args)
      case args.first
      when Point
        args.first
      When Array
        Point.new(*args.first)
      When Integer
        Point.new(*args)
      When String
        Point.new(*args.first.split(':').map(&:to_i))
      else
        raise TypeError, 'Connot convert to Point'
      end
    end

  end
    Point = Struct.new(:x, :y) do
      def inspect
        "#{x}:#{y}"
      end
    end
end

include Graphics
include Graphics::Conversions
p Point(Point.new(2, 3))