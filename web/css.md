# Starting with some HTML

Our starting point is an HTML document. Copy the code from below and save the code below as index.html in a folder on your machine.

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Getting started with CSS</title>
</head>

<body>

    <h1>I am a level one heading</h1>

    <p>This is a paragraph of text. In the text is a <span>span element</span>
and also a <a href="http://example.com">link</a>.</p>

    <p>This is the second paragraph. It contains an <em>emphasized</em> element.</p>

    <ul>
        <li>Item one</li>
        <li>Item two</li>
        <li>Item <em>three</em></li>
    </ul>

</body>

</html>
```

# Adding CSS to our document

The very first thing we need to do is to tell the HTML document that we have some CSS rules we want it to use. There are three different ways to apply CSS to an HTML document that you'll commonly come across, however, for now, we will look at the most usual and useful way of doing so — linking CSS from the head of your document.

Create a file in the same folder as your HTML document and save it as `styles.css`. The `.css` extension shows that this is a CSS file.

To link styles.css to index.html add the following line somewhere inside the `<head>` of the HTML document:
```html
<link rel="stylesheet" href="styles.css">
```
This `<link>` element tells the browser that we have a stylesheet, using the rel attribute, and the location of that stylesheet as the value of the href attribute.
We can test this, by adding a rule in `style.css`

```css
h1 {
  color: red;
}
```

Save the HTML and CSS files and reload the page in a web browser. The level one heading at the top of the document should now be red

# Styling HTML elements

By making our heading red we have already demonstrated that we can target and style an HTML element. We do this by targeting an `element` selector — this is a selector that directly matches an HTML element name. To target all paragraphs in the document you would use the selector p. To turn all paragraphs green you would use:

```css
p {
  color: green;
}
```

You can target multiple selectors at once, by separating the selectors with a comma. If I want all paragraphs and all list items to be green my rule looks like this:

```css
p, li {
    color: green;
}
```

# Adding a class

So far we have styled elements based on their HTML element names. This works as long as you want all of the elements of that type in your document to look the same. Most of the time that isn't the case and so you will need to find a way to select a subset of the elements without changing the others. The most common way to do this is to add a class to your HTML element and target that class.

In your HTML document, add a class attribute to the second list item. Your list will now look like this:

```html
<ul>
  <li>Item one</li>
  <li class="special">Item two</li>
  <li>Item <em>three</em></li>
</ul>
```

In your CSS you can target the class of special by creating a selector that starts with a full stop character. Add the following to your CSS file:

```css
.special {
  color: orange;
  font-weight: bold;
}
```

You can apply the class of `special` to any element on your page that you want to have the same look as this list item. For example, you might want the `<span>` in the paragraph to also be orange and bold. Try adding a `class` of `special` to it, then reload your page and see what happens.

Sometimes you will see rules with a selector that lists the HTML element selector along with the class:
```css
li.special {
  color: orange;
  font-weight: bold;
}
```
This syntax means "target any `li` element that has a class of special". If you were to do this then you would no longer be able to apply the class to a `<span>` or another element by simply adding the class to it.
