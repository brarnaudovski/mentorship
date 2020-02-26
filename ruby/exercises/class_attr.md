# What is attr_accessor?

`attr_accessor` is nothing more than a simple method from Ruby, which can be used within every class, and you can pass an arguments to it. With `attr_accessor` in place, you'll have all the class attributes defined for free. Recall that `attr_accessor` allows you to this:

```ruby
class Person
  attr_accessor :name, :age
end

x = Person.new
x.name = "Fred"
x.age = 10

puts x.name, x.age

```

However, in reality `attr_accessor` isn’t doing anything magical. It’s simply writing some code for you. This code is equivalent to the single `attr_accessor :name, :age` line in the preceding `Person` class

```ruby
class Person
  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def age
    @age
  end

  def age=(age)
    @age = age
  end
end
```

This code defines the name and age methods that return the current object variables for those attributes, so that `x.name` and `x.age` (as in the prior code) work. It also defines two “setter” methods that assign the values to the `@name` and `@age` object variables.

If you pay attention to the names of the setter methods, you’ll see they’re the same as the methods that return values but suffixed with an equals sign (=). This means they’re the methods that are run for code such as `x.name = "Fred"` and `x.age = 10`. In Ruby, assignments are just calls to regular methods! Indeed, `x.name = "Fred"` is merely shorthand for `x.name=("Fred")`.

---

# ToDo
Create a second version of `MyCar` class. Recall the initial requirement:
>Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. Create instance methods that allow the car to speed up, brake, and shut the car off.

And for this task
*  add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.
* Create a method called `spray_paint` that can be called on an object and will modify the color of the car.

