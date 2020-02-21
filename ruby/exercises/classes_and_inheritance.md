# Classes & Inheritance

```ruby
# Here's some classes, remember type it exactly.

class Shape
end

class Rectangle < Shape
  def initialize(width, length)
    @width = width
    @length = length
  end

  def area
    @width * @length
  end

  def perimeter
    2 * @width + 2 * @length
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
end

```

Type this above into a single ruby file, and from Terminal (using IRB) run:

 `irb -r ./classes.rb`

_Make sure you are in the right path. Meaning running `ls` from the Terminal, should list the `classes.rb` file._

_Please note if you are making changes to the `classes.rb`, you must exit from IRB an re-run the command above_

---

## **Play with IRB and  make new objects from the classes defined in `classes.rb`**

```shell
rec = Rectangle.new(5,8)
rec.area
rec.perimeter

tri = Triangle.new(5, 8, 2, 3, 4)
tri.area
tri.perimeter

rec_2 = Rectangle.new(12,14)
rec_2.area
rec_2.perimeter
```

---
---


# What was that?

## Classes and Objects
A __class__ is a blueprint for objects. You have only one class called `Shape`, but with it you can create multiple
instances of shapes (Shape objects), all of which have the methods and attributes defined by the `Shape` class.

An __object__ is an instance of a class. If `Shape` is the class, then `x = Shape.new` creates a new `Shape` instance
and makes `x` reference that object. You would then say `x` is a `Shape` object, or an object of class `Shape`.

The first method in our example in the `Rectangle` class is `initialize`. __initialize__ is a special method that’s called when a new object based on that class is created. When you call `Rectangle.new(5, 8)`, the `Rectangle` class creates a new object instance of itself, and then calls initialize on that object.

In this case, initialize accepts two argument into `width` and `length` as passed by `Rectangle.new(5, 8)`, and assigns the number 5 (now referenced by `width`) to a variable called `@width`, and the number 8 (now referenced by `length`) to a variable called `@length`. The `@` symbol before the variable name is called instance variable.

Where __local__ variables are specific to the local scope, and __global__ variables (starts with `$`) have global scope, instance variables (also known as object variables) are so named because they have scope within, and are associated with, the current object. In our example with the `rec` and `rec_2` objects from the class `Rectangle` we have different values assigned to the instance variables called `@width` and `@length`.

## Inheritance

An interesting object-oriented programming concept is _inheritance_, which allows you to generate a taxonomy of classes and objects. The benefit of inheritance is that classes lower down the hierarchy get the features of those higher up, but can also add specific features of their own.
Ruby’s inheritance features are similarly simple. Any class can inherit the features and functionality of another class, but a class can inherit only from a _single_ other class.

# Todo
* Introduce new Shape called Square, and write its `area` and `perimeter` methods. _Hint:_ Square is a special type of Rectangle, where all of the sides are equal.
* Make new object method called `welcome` in every class. Running `welcome` on a `Triangle` object should print:
```ruby
"Hi. I am Triangle, and my parent says: Hi, I am Shape, and I am the parent"

```
