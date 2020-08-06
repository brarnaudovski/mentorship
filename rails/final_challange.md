# Recipe web application

## Challenge

Build a web application for recipes. One recipe contains a title, description, and a set of instructions for preparing a particular dish and a list of ingredients need to prepare the dish.

## Stories

- Visiting the home page of the application should list all of the recipes available.
- Minimum user attributes must be a handle name, e-mail address, first name and last name.
- Build a minimal authentication solution.
- Visiting a particular recipe should present the recipe title, recipe description, the recipe's user, together with the recipe instructions and the list of the recipe ingredients.
- The recipe instruction holds free text information and the order of the instruction. For example 1. Preheat oven to 400 degrees F (200 degrees C). Grease a 10-inch round baking dish. 2. Melt butter in a large skillet over medium heat
- Visiting a user profile page should list all the user's recipes, after some basic user info.


## Rules

- Logged in user can:
  - Create a recipe.
  - Edit its recipes.
  - Destroy its recipes.
  - Edit/Destroy recipe instruction
  - Edit/Destroy recipe ingredient
- Un-logged in user can only see the index page (all articles), and a user profile page.
- The user profile page should include the user *full* name alongside with the handle name and the email address.
- No usage of third party libraries for authentication. Build a minimal authentication solution using `has_secure_password` and a `session` storage.
- Destroying a recipe should destroy its instructions and its ingredients.
- The recipe instructions must be presented by the order which are defined.
- Build one page(form) to create the recipe, together with the instructions and the ingredients. (Hint: see notes about nested forms)
- Build additional form(s) for creating/editing/destroying individual recipe instruction and/or recipe ingredient
- Use a CSS library, like Bulma;
- Use a *flash* messages if needed to notify the end user.

---

Note about nested forms:
Rails provide instruction on how to create the nested form.
In the instructions, you must set multiple sets of fields ahead of time. Meaning, you'll need to define up to how many new instructions and ingredients will be created with the recipe.
Otherwise, if you want to add them only when a user clicks on an 'Add new address' button, you'll need to have some JavaScript code. This option is out of scope for this challenge.
It is up to you to define how many multiple sets you'll have in your form for the instructions and ingredients respectfully.

By using the nested form, you'll need to prevent empty records, and an option to remove instructions or ingredients.

---

## Scoring

The scoring will be based on the following points:
- Readme file: Info about this app. How to install the app to be able someone to contribute? What are the minimal requirements to be able to install the application? and so on.
- Seed file: It should contain all the record needed to seed the database with its default values and a relations. (Hint: Use factories to create the model objects)
- Following MVP architecture, together with the RESTful architecture:
  - The model:
    - Relation: the relation type, and any usage of the relation options;
    - Validation: the validation type and any usage of the validation options;
    - Usage of constants;
  - The controller:
    - Clean and minimal controller actions;
    - Usage of a controller filter (`before_filter`);
    - Usage of a strong params;
  - The view:
    - Integration with a CSS framework;
    - Writing and applying own CSS rules;
    - Usage of a partial file;
    - Simple and readable ERB code;
- Writing specs using RSpec:
  - Model specs;
  - System specs for the *happy* scenarios (using `rack_test`);
  - Request specs for any edge case scenarios;
  - Usage of factories;
  - Running any or all the specs, should print the output in a documentation style;
- Commits: Atomic and understandable commit messages.
- Overall code consistency: indentations, new lines, etc.
- Namings off model/controller classes, spec files, or any other classes/files
- Defining a migration file.


