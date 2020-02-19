# Methods can return something

You have the option to assign a method to a variable, like we did for String, Numbers and any other data structure.

Consider this:

```ruby
def add(a, b)
  puts "ADDING #{a} + #{b}"

  a+b
end

def subtract(a, b)
  puts "SUBTRACTING #{a} - #{b}"

  a-b
end

def multiply(a, b)
  puts "MULTIPLYING #{a} * #{b}"

  a*b
end

def divide(a, b)
  puts "DIVIDING #{a} / #{b}"

  a/b
end

puts "Let's do some math with just methods!"

age = add(30, 5)
height = subtract(78,4)
weight = multiply(90, 2)
iq = divide(100, 2)

puts "Age: #{age}, Height: #{height}, Weight: #{weight}, IQ: #{iq}" # A puzzle for the extra credit, type it in anyway.

puts "Here is a puzzle."

what = add(age, subtract(height, multiply(weight, divide(iq, 2))))
puts "That becomes: #{what} Can you do it by hand?"
```


We are now doing our own math methods for `add`, `subtract`, `multiply`, and `divide`. The important thing to notice is the last line where we say `a + b` (in `add`). What this does is the following:
* Our method is called with two arguments: `a` and `b`.
* We print out what our method is doing, in this case “ADDING”.
* Then we tell Ruby to do something kind of backward: we return the addition of a + b. You might say this as, “I add a and b then return them.” In Ruby, the last evaluated statement in a method is its return value. You can be more explicit if you want and type `return a + b`, but that is totally optional.
* Ruby adds the two numbers. Then when the method ends any line that runs it will be able to assign this a + b result to a variable.

Type this above into a single ruby file, and from Terminal run:

 `ruby methods_2.rb`

---

## **What should you see**

```shell
$ ruby methods_2.rb
Let's do some math with just methods!
ADDING 30 + 5
SUBTRACTING 78 - 4
MULTIPLYING 90 * 2
DIVIDING 100 / 2
Age: 35, Height: 74, Weight: 180, IQ: 50
Here is a puzzle.
DIVIDING 50 / 2
MULTIPLYING 180 * 25
SUBTRACTING 74 - 4500
ADDING 35 + -4426
That becomes: -4391 Can you do it by hand?
```

---
---
---

# Todo
* At the end of the script is a puzzle. we are taking the return value of one method, and using it as the argument of another method. That is a valid code, but it looks weird. Try to write the same line of code, but using variables, to 'clean-up' the code expression
