# Methods

Methods do three things:
1. They name pieces of code the way variables name strings and numbers.
2. They take arguments.
3. Using #1 and #2 they let you make your own “mini scripts” or “tiny commands”.

You can create a methods by using the word `def` in Ruby

```ruby
def puts_two(arg1, arg2)
  puts "arg1: #{arg1}, arg2: #{arg2}"
end

# this just takes one argument
def puts_one(arg1)
  puts "arg1: #{arg1}"
end

# this one takes no arguments
def puts_none()
  puts "I got nothing'."
end

puts_two("Zed","Shaw")
puts_one("First!")
puts_none() # same as puts_none, without ()
```

Let’s break down the `puts_two` method
* First we tell Ruby we want to make a method using `def` for “define”.
* On the same line as `def` we then give the method a name, in this case we just called it “puts_two” but it could be “peanuts” too. It doesn’t matter, except that your method should have a short name that says what it does.
* Then we tell it we want `arg1`, `arg2` as arguments.
* After the definition, all the lines that are indented 2 spaces will become attached to this name, puts_two.
* To demonstrate how it works we print these arguments out, just like we would in a script.


Type this above into a single ruby file, and from Terminal run:

 `ruby methods.rb`

---

## **What should you see**

```shell
$ ruby methods.rb
arg1: 'Zed', arg2: 'Shaw'
arg1: 'First!'
I got nothing'.
```

---
---
---

# Todo
* Make your own methods which can puts a string in reverse. For example, if I call the method with `hello`, I should get `olleh`
