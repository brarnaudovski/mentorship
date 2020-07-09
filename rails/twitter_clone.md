# *TwitterClone* web application

This build introduces a well known social media giant Twitter into the mix as inspiration for the task. We will be creating a knock-off of sorts called *TwitterClone*.

---

**Before start**, please consider this:
 - Build at your own tempo. No need to rush. No deadline to make.
 - Follow the solution in the *Blog* application if you need help/direction.
 - Try not to copy-paste from other solutions.
 - Note every *how?* and *why?*, and report to me or in the group.

---

### Building Tweets

First feature we want to build is a basic CRUD action where we can create, read, update, and destroy *Tweets*.

Short direction:
 - Create new app using the `rails new` command.
 - Consider to use `git` to track the files/changes. In addition of `git`, create new repo in Github and attach this project to Github.
 - Create the controller and the views for the *Twitter* resource. If you know upfront what action you'll need in the controller, you may use the `rails generate controller` command to scaffold the controller and the views.

Additional tasks:
 - Add model validation for the tweets. We want the tweet *body* to be present, and to be maximum 140 character long
 - Use CSS framework of your choice. You should continue with Bulma for start, and the UI design is up to you
 - Create a new model called *Comment* with *commenter* and a *body* attributes, which should be in a relation with *Tweet*. One tweet can have many comments, and a comment belongs to a tweet. (Although in the real word, tweet comments are just a tweet, but let's stick with a different model). **Note**: A *comment* cannot exist in the DB if the associated *tweet* is deleted
 - Add option to delete a comment.
 - Create a new model called *User*. At first, it should have only *email*, and *name* attributes.
    - Add validation for those attributes;
    - Add relation from User to Tweet
    - Add relation from User to Comment
 - Update the User model to store passwords, and an option for authentication. Hint: `has_secure_password`:
    - Add validation for the `password` attribute.
 - Write model specs
 - Write system specs
