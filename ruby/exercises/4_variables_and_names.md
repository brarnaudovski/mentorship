# Variables And Names

_Variable_ (computer terminology for a “placeholder”).

Programmers use these variable names to make their code read more like English, and because they have lousy memories. If they didn’t use good names for things in their software, they’d get lost when they tried to read their code again.

Variables in Ruby can refer to any value-related concept that Ruby understands, such as numbers, text, and other data structures

```ruby
cars = 100
space_in_a_car = 4.0
drivers = 30
passengers = 90
cars_not_driven = cars - drivers
cars_driven = drivers
carpool_capacity = cars_driven * space_in_a_car average_passengers_per_car = passengers / cars_driven
puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available."
puts "There will be #{cars_not_driven} empty cars today."
puts "We can transport #{carpool_capacity} people today."
puts "We have #{passengers} passengers to carpool today."
puts "We need to put about #{average_passengers_per_car} in each car."
```

Type this above into a single ruby file, and from Terminal run:

 `ruby ex4.rb`

---

## **What should you see**

```shell
$ ruby ex4.rb
There are 100 cars available.
There are only 30 drivers available.
There will be 70 empty cars today.
We can transport 120.0 people today.
We have 90 passengers to carpool today.
```

---
---
---

# Todo
+ Explain why the 4.0 is used instead of just 4. (Write in a comment line)
+ Write comments above each of the variable assignments.
+ Make sure you know what = is called (equals) and that it’s making names for things.
+ Remember _ is an underscore character.
