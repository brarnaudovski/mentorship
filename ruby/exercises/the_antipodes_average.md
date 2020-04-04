# The Antipodes Average

Math definition:
>In mathematics, the antipodal point of a point on the surface of a sphere is the point which is diametrically opposite to it – so situated that a line drawn from the one to the other passes through the center of the sphere and forms a true diameter.

>This term applies to opposite points on a circle or any n-sphere.

We want to use this definition, with little modification, an apply to an Array object.

## The Task

In this task, you are given an array and in turn, you must obtain a smaller array, following three steps:

- Split the array into two parts of equal length. If the given array has an odd length, then you have to eliminate the number in the middle of the array for obtaining two equal parts.
- Sum each number of the first part with each number of the reversed second part, obtaining a new single array having the same length of the previous two.
- Divide by two each number in the final array.

Given an array of integers `arr`, implement a function that returns a new array applying the above algorithm.

---

**Examples**

```
antipodes_average([1, 2, 3, 4]) ➞ [2.5, 2.5]

# Steps:
Left part = [1, 2]
Reversed right part = [4, 3]
Array resulting from the sum of each pair = [5, 5]
Each number is divided by two = [2.5, 2.5]
```

---
```
antipodes_average([1, 2, 3, 4, 5]) ➞ [3, 3]

# Steps
The length of array is odd, number 3 (in the middle) is eliminated
Left = [1, 2]
Reversed right = [5, 4]
Sum = [6, 6]
Division by two = [3, 3]
```
---

```
antipodes_average([-1, -2]) ➞ [-1.5]

# Steps
(-1 + -2) / 2 = [-1.5]
```
---

**Note**: In case the array contains less then two elements, you need to return the input array
