# Rails Overview

When you install the Rails framework, you also get a new command-line tool, `rails`, that’s used to construct each new Rails application you write.

Rails also does a lot of magic behind the curtain to get our applications to work with a minimum of explicit configuration. To get this magic to work, Rails needs to find all the various components of your application. This means we need to create a specific directory structure, slotting the code we write into the appropriate places. The rails command creates this directory structure for us and populates it with some standard Rails code.

To create your first Rails application, pop open a shell window, and navigate to a place in your filesystem where you want to create your application’s directory structure.
In that directory, use the rails command to create an application called `demo`.

*Note: Be slightly careful here if you have an existing directory called demo, you’ll be asked if you want to overwrite any existing files.*

```
❯ cd projects
❯ rails new demo
```
*Note: If you're using Windows Subsystem for Linux then there are currently some limitations on file system notifications that mean you should disable the spring and listen gems which you can do by running `rails new blog --skip-spring --skip-listen`*

When the last command is finish, then you'll need to change the directory to the project folder:

```
❯ cd demo
```

Examine your installation using the following command:
```
❯ rails about
```
Once you have `rails about` working, you have everything you need to start a stand-alone web server that can run our newly created Rails application. You can start the server by typing:

```
❯ rails server
```

If no error pop ups, you look at the window (console) where you started the server, you can see tracing showing that you started the application. This console will be your best friend when building your application. It can show all of the action/request coming from the web application, and will help you out to make any code debugging.

*Note. The command to shut down the server is `CTL-C`*

At this point, we have a new application running, but it has none of our code in it.

## Adding new content

Before adding new content we need code for the controller and for the view, and we need a route to connect the two (*this comes from the MVC*). We don’t need code for a model, because we’re not dealing with any data.

In the same way that we used the `rails` command to create a new Rails application, we can also use a generator script to create a new controller for our project. This command is `rails generate`.

*Note: Make sure you are in the `demo` directory before running the command*

```
❯ rails generate controller Say hello goodbye
```
This command logs the files and directories which are created. For now, we'll be looking at in the controller. You can find it in the `app/controllers/say_controller.rb`

You can notice that we have class named `SayController` that inherits from `ApplicationController`, so it automatically gets the default controller behavior. In the `SayController` we have empty methods (actions) named `hello` and `goodbye`.
To understand why these methods are named this way, you need to look at the way Rails handles requests.

## Request URLs

Like any other web application, a Rails application appears to its users to be associated with a URL. When you point your browser at that URL, you’re talking to the application code, which generates a response to you.

Let's navigate to the URL `http://localhost:3000/say/hello` in a browser. You can text like:
```
Say#hello
Find me in app/views/say/hello.html.erb
```

### The action

When we write the URL action, we can see not only that we’ve connected the URL to our controller but also that Rails is pointing the way to next step, to tell Rails what to display. That’s where views come in. This view file/directory, and the content was created when we run the `rails generate controller` command. That directory contains the template files for the controller’s views. In our case, we created a controller named `say`, so the views will be in the `app/views/say` directory. Inside that directory, Rails looks for templates/files with the same name as the action it’s handling. In our last example, will be file called `hello.html.erb`.

*Note: `.erb` comes from ERB (ebeded ruby) library, that gives us an option to write Ruby code inside other type of files.*

For now, we’ve looked at two files in our Rails application tree. We looked at the controller, and we modified a template to display a page in the browser. These files live in standard locations in the Rails hierarchy: controllers go into `app/controllers`, and views go into subdirectories of `app/views`.

## Dynamic content

You can create dynamic templates in Rails in many ways. The most common way, which we’ll use here, is to embed Ruby code in the template. That’s why we named our template file `hello.html.erb`. The `.html.erb` suffix tells Rails to expand the content in the file using a system called ERB.
ERB is a library, installed as part of the Rails installation, that takes an .erb file and outputs a transformed version. The output file is often HTML in Rails, but it can be anything. Normal content is passed through without being changed. However, content between `<%=` and `%>` is interpreted as Ruby code and executed. The result of that execution is converted into a string, and that value is substituted in the file in place of the `<%=...%>` sequence. For example, you can change `hello.html.erb` to display the current time:

```html
<h1>Hello from Rails!!</h1>
<p>
  It is the time in zone  <%= Time.now %>
</p>
```
*Notice that the time displayed updates each time the browser window is refreshed. It looks as if we’re really generating dynamic content.*

### Adding the Time

We now know how to make our application display dynamic data. The second issue we have to address is working out where to get the time from.
We’ve shown that we can insert ruby code into the html templates. In our case it was `Time.now` into the `hello.html.erb` view file. Each time they access this page, users will see the current time substituted into the body of the response.

In general, we probably want to do something slightly different. We’ll move the determination of the time to be displayed into the controller and leave the view with the simple job of displaying it. We’ll change our action method in the controller to set the time value into an instance variable called `@time`:

```ruby
class SayController < ApplicationController
  def hello
    @time = Time.now
  end

  def goodbye
  end
end
```
In the .html.erb template, we’ll use this instance variable to substitute the time into the output:

```html
<h1>Hello from Rails!!</h1>
<p>
  It is the time in zone  <%= @time %>
</p>
```

When we refresh our browser window, we again see the current time, showing that the communication between the controller and the view was successful.

## Linking Pages Together

Let’s see how we can add another stunning example of web design to our Hello, World! application.
Normally, each page in our application will correspond to a separate view. While we’ll also use a new action method to handle the new page, we’ll use the same controller for both actions. This needn’t be the case, but we have no compelling reason to use a new controller right now.
We already defined a goodbye action for this controller, so all that remains is to update the scaffolding that was generated in the app/views/say directory. This time the file we’ll be updating is called `goodbye.html.erb`, because by default templates are named after their associated actions:

```html
<h1>Goodbye!</h1>
<p>
  It was nice having you here.
</p>
```

Now if we need to link the two screens, we’ll need to put a link on the hello screen that takes us to the goodbye screen, and vice versa. We can do this by using hyperlinks.
We already know that Rails uses a convention to parse the URL into a target controller and an action within that controller. So, a simple approach would be to adopt this URL convention for our links.

In `hello.html.erb`:
```html
<p>
  Say <a href="/say/goodbye"> Goodbye </a>!
</p>
```

In `goodbye.html.erb`:
```html
<p>
  Say <a href="/say/hello"> Hello </a>!
</p>
```

This approach would certainly work, but it’s a bit fragile. If we were to move our application to a different place on the web server, the URLs would no longer be valid. For this and many more other reasons, Rails comes with a bunch of helper methods that can be used in view templates. Here, we’ll use the `link_to()` helper method, which creates a hyperlink to an action.

Using `link_to()`, `hello.html.erb` becomes the following:
```html
<p>
  Say <%= link_to "Goodbye!", say_goodbye_path %>
</p>
```

and `goodbye.html.erb` becomes the following:
```html
<p>
  Say <%= link_to "Hello!", say_hello_path %>
</p>
```

**Important note:**
`link_to` is Rails method and `say_hello_path` is a precomputed value that Rails makes available to application views. It evaluates to the `/say/hello` path.

## Playtime
Experiment with the following expressions:
- Addition: <%= 1+2 %>
- Concatenation: <%= "cow" + "boy" %>
- Time in one hour: <%= 1.hour.from_now.localtime %>

A call to the following Ruby method returns a list of all the files in the current directory: `@files = Dir.glob('*')`

Use it to set an instance variable in a controller action, and then write the corresponding template that displays the filenames in a list on the browser.
Hint: you can iterate over a collection using something like this:
```
<% @files.each do |file| %>
  file name is: <%= file %>
<% end %>
```
You might want to use a `<ul>` for the list.
