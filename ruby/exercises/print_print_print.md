# Print Print Print

```ruby
# Here's some new strange stuff, remember type it exactly.

days = "Mon Tue Wed Thu Fri Sat Sun"
months = "Jan\nFeb\nMar\nApr\nMay\nJun\nJul\nAug"
puts "Here are the days: ", days
puts "Here are the months: ", months
puts <<PARAGRAPH
There's something going on here.
With the PARAGRAPH thing
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
PARAGRAPH
```

Type this above into a single ruby file, and from Terminal run:

 `ruby ex9.rb`

---

## **What should you see**

```shell
$ ruby ex9.rb
Here are the days:
Mon Tue Wed Thu Fri Sat Sun
Here are the months:
Jan
Feb
Mar
Apr
May
Jun
Jul
Aug
There's something going on here.
With the PARAGRAPH thing
We'll be able to type as much as we like.
Even 4 lines if we want, or 5, or 6.
```

---
---


# What was that?
This example showed you two ways to make a string that goes across multiple lines. In the first way, using characters `\n` (back-slash n) between the names of the months. What these two characters do is put a new line character into the string at that point.
The use of the `\` (back-slash) character is a way we can put difficult-to-type characters into a string. There are plenty of these “escape sequences” available for different characters you might want to put in, but there’s a special one, the double back-slash which is just two of them `\\`. These two characters will print just one back-slash.

Another important escape sequence is to escape a single-quote `'` or double-quote `"`. Imagine you have a string that uses double-quotes and you want to put a double-quote in for the output. If you dot his `"I "understand" joe."` then Ruby will get confused since it will think the `"` around "understand" actually ends the string. You need a way to tell Ruby that the `"` inside the string isn’t a real double-quote.

To solve this problem you escape double-quotes and single-quotes so Ruby knows to include in the string. Here’s an example:

```ruby
"I am 6'2\" tall." # escape double-quote inside string
'I am 6\'2" tall.' # escape single-quote inside string
```

The second way is by using here document syntax, which uses `<<NAME `and works like a string, but you also can put as many lines of text you as want until you type `NAME` again.

```ruby
tabby_cat = "\tI'm tabbed in."
persian_cat = "I'm split\non a line."
backslash_cat = "I'm \\ a \\ cat."
fat_cat = <<MY_HEREDOC I'll do a list:
\t* Cat food
\t* Fishies
\t* Catnip\n\t* Grass
MY_HEREDOC

puts tabby_cat
puts persian_cat
puts backslash_cat
puts fat_cat
```

# Todo
* Write the example and present the result
* Search online to see what other escape sequences are available.
