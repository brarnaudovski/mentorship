# Chocolate Dilemma

Two people are eating chocolate, whose pieces are represented as sub-arrays of `[l x w]`.

Write a method that returns `true` if the total area of chocolate is the same for each person.

Example:
```ruby
fairness?([[4, 3], [2, 4], [1, 2]], [[6, 2], [4, 2], [1, 1], [1, 1]]) # returns true
```
___
Break down

1st person: `[4, 3], [2, 4], [1, 2]`

2nd person `[6, 2], [4, 2], [1, 1], [1, 1]`

Total area of the 1st person:

`4x3 + 2x4 + 1x2 = 12 + 8 + 2 = 22`

Total area of 2nd person:

`6x2 + 4x2 + 1x1 + 1x1 = 12 + 8 + 1 + 1 = 22`
