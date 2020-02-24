# One possible solution for the Object inheritance task at https://github.com/brarnaudovski/mentorship/blob/b35f47a6e0d52a9a9d2ec5d9c1e5e46da8ed7f71/ruby/exercises/classes_and_inheritance.md#todo

class Shape
  def welcome
    "Hi, I am Shape, and I am the parent"
  end
end

class Rectangle < Shape
  def initialize(width, length)
    @width = width
    @length = length
  end

  def welcome
    "Hi. I am Rectangle, and my parent says: " + super
  end

  def area
    @width * @length
  end

  def perimeter
    2 * @width + 2 * @length
  end
end

class Square < Rectangle
  def initialize(side)
    super(side, side)
  end

  def welcome
    "Hi. I am Square, and my parent says: " + super
  end
end

class Triangle < Shape
  def initialize(base_width, height, side1, side2, side3)
    @base_width = base_width
    @height = height
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def area
    @base_width * @height / 2
  end

  def perimeter
    @side1 + @side2 + @side3
  end

  def welcome
    "Hi. I am Triangle, and my parent says: " + super
  end
end
