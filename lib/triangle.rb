class Triangle

    attr_accessor :a, :b, :c

    def initialize(a, b, c)
      @a = a
      @b = b
      @c = c
    end

    def kind
      validate_triangle
      if a == b && b == c
        :equilateral
      elsif a == b || b == c || c == a
        :isosceles
      else
        :scalene
      end
    end

    def validate_triangle
      valid_triangles = [(a + b > c), (a + c >b), (b + c > a)]
      [a, b, c].each do |side|
        valid_triangles << false unless side >0 
        raise TriangleError if valid_triangles.include?(false)
      end
    end



    class TriangleError < StandardError
      # triangle error code
    end

end
