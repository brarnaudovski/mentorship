# String and Text

A string is usually a bit of text you want to display to someone, or “export” out of the program you are writing. Ruby knows you want something to be a string when you put either `"` (double-quotes) or `'` (single-quotes) around the text. You saw this many times with your use of puts when you put the text you want to go to the string inside `"` or `'` after the `puts`

Another way of injecting variables into your strings is to use something called “string interpolation”, which uses the #{ }(pound and curly brace) characters


name1 = "Joe" name2 = "Mary" puts "Hello %s, where is %s?" % [name1, name2]

We can type:

name1 = "Joe" name2 = "Mary" puts "Hello #{name1}, where is #{name2}?"

```ruby
x = "There are #{10} types of people."
binary = "binary"
do_not = "don't"
y = "Those who know #{binary} and those who #{do_not}."

puts x puts y
puts "I said: #{x}."
puts "I also said: '#{y}'."

hilarious = false
joke_evaluation = "Isn't that joke so funny?! #{hilarious}"
puts joke_evaluation

w = "This is the left side of..."
e = "a string with a right side."
puts w + e
```

Type this above into a single ruby file, and from Terminal run:

 `ruby ex6.rb`

---

## **What should you see**

```shell
$ ruby ex6.rb
There are 10 types of people.
Those who know binary and those who don't.
I said: There are 10 types of people..
I also said: 'Those who know binary and those who don't.'. Isn't that joke so funny?! false
This is the left side of...a string with a right side.
```

---
---
---

# Todo
* Go through this program and write a comment above each line explaining it.
* Find all the places where a string is put inside a string. There are four places.
* Explain why adding the two strings w and e with + makes a longer string.
