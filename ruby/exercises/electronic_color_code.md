# Electronic color code

An electronic color code is used to indicate the values or ratings of electronic components, usually for resistors, but also for capacitors, inductors, diodes and others.

## Resistors
- Each resistor has a resistance value.
- Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read. To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values. Each band has a position and a numeric value.

---

To distinguish left from right there is a gap between the C and D bands:

![alt text][bands] ![alt text][colors]

[bands]: https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Resistor_bands.svg/170px-Resistor_bands.svg.png "Resistor bands"

[colors]: https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/4-Band_Resistor.svg/200px-4-Band_Resistor.svg.png "Resistor colors"

[chart]: https://www.researchgate.net/profile/Amir_Yavariabdi/publication/325967064/figure/fig1/AS:641336315236352@1529917901761/Resistance-color-code-chart-with-examples-of-4-and-5-band-resistors.png "Chart"

+ (A) The first significant figure of component value (left side)
- (B) The second significant figure (some precision resistors have a third significant figure, and thus five bands).
+ (C) The decimal multiplier (number of trailing zeroes)
- (D) If present, indicates tolerance of value in percent (no band means 20%)

In the above example, a resistor with bands of red, violet, green, and gold has first digit 2 (red; see table below), second digit 7 (violet), followed by 5 (green) zeroes: 2700000 ohms. Gold signifies that the tolerance is ±5%.

All coded components have at least two value bands and a multiplier; other bands are optional.

![alt text][chart]

---

**Task 1**

In this task you are going to create a helpful program so that you don't have to remember the values of the bands. The program will take color names as input and output a two digit number, even if the input is more than two colors!
For example: `['brown', 'green']` should return 15; `['brown', 'green', 'violet']` should return 15 too, ignoring the third color.


**Task 2**
We want to upgrade task1 and add new method called `specification`. This method should print the specification of the resistor in format: `xxxx ohms +/- yy%`, where `xxxx` is the total ohms for a resistor, and `yy` represent the tolerance for a resistor. For example, a resistor with bands of red, violet, green, and brown has first digit 2 (red; see table below), second digit 7 (violet), followed by 5 (green) zeroes: 2700000 ohms. Brown signifies that the tolerance is ±1%. For this type of resistor the specification is: `2700000 ohms +/-1%`
