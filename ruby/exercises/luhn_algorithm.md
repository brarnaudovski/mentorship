# Luhn algorithm

Given a number determine whether or not it is valid per the Luhn formula.

The [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm) is a simple checksum formula used to validate a variety of identification numbers, such as credit card numbers and Canadian Social Insurance Numbers.

The task is to check if a given string is valid.

## Validating a Number

Strings of length 1 or less are not valid. Spaces are allowed in the input, but they should be stripped before checking. All other non-digit characters are disallowed.

---

**Example 1**: Valid credit card number

```
4539 1488 0343 6467
```

The first step of the Luhn algorithm is to double every second digit, starting from the right. We will be doubling

```
4_3_ 1_8_ 0_4_ 6_6_
```

If doubling the number results in a number greater than 9 then subtract 9 from the product. The results of our doubling:

```
8569 2478 0383 3437
```
Then sum all of the digits:

```
8+5+6+9+2+4+7+8+0+3+8+3+3+4+3+7 = 80
````
If the sum is evenly divisible by 10, then the number is valid. This number is valid!

---

**Example 2**: Invalid credit card number
```
8273 1232 7352 0569
```

Double the second digits, starting from the right
```
7253 2262 5312 0539
```

Sum the digits
```
7+2+5+3+2+2+6+2+5+3+1+2+0+5+3+9 = 57
```

57 is not evenly divisible by 10, so this number is not valid.


## Using tests

Validate that:
- single digit strings can not be valid. Ex: '1'
- a single zero is invalid. Ex: '0'
- a simple valid sin that remains valid if reversed. Ex: '059'
- a simple valid sin that becomes invalid if reversed. Ex: '59'
- a valid canadian sin. Ex: '055 444 285'
- invalid canadian sin. Ex: '055 444 286'
- invalid credit card. Ex: '8273 1232 7352 0569'
- valid strings with a non digit included become invalid. Ex: '055a 444 285'
- valid strings with a non digit added at the end become invalid. Ex: '059a'
- valid strings with punctuation included become invalid. Ex: '055-444-285'
- valid strings with symbols included become invalid. Ex: '055£ 444$ 285'
- single zero with space is invalid. Ex: ' 0'
- more than a single zero is valid. Ex: '0000 0'
- input digit 9 is correctly converted to output digit 9. Ex: '091'
- strings with non digits is invalid. Ex: ':9'
