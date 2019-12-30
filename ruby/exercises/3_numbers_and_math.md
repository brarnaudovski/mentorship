# Numbers and Math

```
+   plus
-   minus
/   slash
*   asterisk
%   percent
<   less-than
>   greater-than
<=  less-than-equal
>=  greater-than-equal
```

```ruby
puts "I will now count my chickens:"

puts "Hens", 25 + 30 / 6
puts "Roosters", 100 - 25 * 3 % 4

puts "Now I will count the eggs:"

puts 3 + 2 + 1 - 5 + 4 % 2 - 1 / 4 + 6

puts "Is it true that 3 + 2 < 5 - 7?"

puts 3 + 2 < 5 - 7

puts "What is 3 + 2?", 3 + 2
puts "What is 5 - 7?", 5 - 7

puts "Oh, that's why it's false."

puts "How about some more."

puts "Is it greater?", 5 > -2
puts "Is it greater or equal?", 5 >= -2
puts "Is it less or equal?", 5 <= -2
```

Type this above into a single ruby file, and from Terminal run:

 `ruby file_name.rb`

---

## **What should you see**

```shell
I will now count my chickens: Hens
30
Roosters
97
Now I will count the eggs:
7
Is it true that 3 + 2 < 5 - 7?
false
What is 3 + 2?
5
What is 5 - 7?
-2
Oh, that's why it's false
How about some more
Is it greater?
true
Is it greater or equal?
true
Is it less or equal?
false
```

---
---
---

# Todo
+ Above each line, use the # to write a comment to yourself explaining what the line does.
+ Start IRB this way again and using the above characters and
what you know, use Ruby as a calculator.
+ Find something you need to calculate and write a new .rb file that does it.
+ Notice the math seems “wrong”? There are no fractions, only whole numbers. Find out why by researching what a “floating point” number is.
+ Rewrite the ruby file to use floating point numbers so it’s more accurate (hint: 20.0 is floating point).
