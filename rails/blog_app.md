# Blog web app

## Creating the Blog Application

Rails comes with a number of scripts called generators that are designed to make your development life easier by creating everything that's necessary to start working on a particular task. One of these is the new application generator, which will provide you with the foundation of a fresh Rails application so that you don't have to write it yourself.

To use this generator, open a terminal, navigate to a directory where you have rights to create files, and type:
```
❯ rails new blog
```
This will create a Rails application called `Blog` in a `blog` directory and install the
gem dependencies that are already mentioned in `Gemfile` using `bundle install`.

*NOTE*: If you're using Windows Subsystem for Linux then there are currently some limitations on file system notifications that mean you should disable the spring and listen gems which you can do by running rails new blog -- skip-spring --skip-listen.

**TIP**: You can see all of the command line options that the Rails application builder accepts by running rails new -h.

After you create the blog application, switch to its folder:
```
❯ cd blog
```

The blog directory has a number of auto-generated files and folders that make up the structure of a Rails application. Most of the work in this tutorial will happen in the app folder, but here's a basic rundown on the function of each of the files and folders that Rails created by default:

File/Folder | Purpose
--- | ---
app/ | Contains the controllers, models, views, helpers, mailers, channels, jobs, and assets for your application. Y ou'll focus on this folder for the remainder of this guide.
bin/ | Contains the rails script that starts your app and can contain other scripts you use to setup, update, deploy, or run your application.
config/ | Configure your application's routes, database, and more.
`config.ru` | Rack configuration for Rack based servers used to start the application. For more information about Rack, see the [Rack website](https://rack.github.io/).
db/ | Contains your current database schema, as well as the database migrations.
Gemfile Gemfile.lock | These files allow you to specify what gem dependencies are needed for your Rails application. These files are used by the Bundler gem
lib/ | Extended modules for your application.
log/ | Application log files.
package.json | This file allows you to specify what npm dependencies are needed for your Rails application. This file is used by Yarn. For more information about Yarn, see the [Yarn website](https://classic.yarnpkg.com/en/).
public/ | The only folder seen by the world as-is. Contains static files and compiled assets.
Rakefile | This file locates and loads tasks that can be run from the command line. The task definitions are defined throughout the components of Rails. Rather than changing Rakefile, you should add your own tasks by adding files to the lib/tasks directory of your application.
README.md | This is a brief instruction manual for your application. You should edit this file to tell others what your application does, how to set it up, and so on.
storage/ | Active Storage files for Disk Service.
test/ | Unit tests, fixtures, and other test apparatus.
tmp/ | Temporary files (like cache and pid files).
vendor/ | A place for all third-party code. In a typical Rails application this includes vendored gems.
.gitignore | This file tells git which files (or patterns) it should ignore. See [GitHub - Ignoring files](https://help.github.com/en/github/using-git/ignoring-files) for more info about ignoring files.
.ruby-version | This file contains the default Ruby version.

## Hello, Rails!
To begin with, let's get some text up on screen quickly. To do this, you need to get your Rails application server running.

### Starting up the Web Server
You actually have a functional Rails application already. To see it, you need to start a web server on your development machine. You can do this by running the following in the blog directory:
```
❯ rails server
```

This will fire up Puma, a web server distributed with Rails by default. To see your application in action, open a browser window and navigate to `http://localhost:3000`. You should see the Rails default information page:

![Rails welcome logo](./images/rails_welcome.png)
---

**TIP**: To stop the web server, hit Ctrl+C in the terminal window where it's running. To verify the server has stopped you should see your command prompt cursor again. For most UNIX-like systems including macOS this will be a dollar sign `$`. In development mode, Rails does not generally require you to restart the server; changes you make in files will be automatically picked up by the server.

The "Yay! You're on Rails!" page is the smoke test for a new Rails application: it makes sure that you have your software configured correctly enough to serve a page.


### Say "Hello", Rails

To get Rails saying "Hello", you need to create at minimum a *route*, a *controller* and a *view*.

A controller's purpose is to receive specific requests for the application. *Routing* decides which controller receives which requests. Often, there is more than one route to each controller, and different routes can be served by different *actions*. Each action's purpose is to collect information to provide it to a view.

A view's purpose is to display this information in a human readable format. An important distinction to make is that the *controller*, not the view, is where information is collected. The view should just display that information. By default, view templates are written in a language called eRuby (Embedded Ruby) which is processed by the request cycle in Rails before being sent to the user.

When we make a request to our Rails applications, we do so by making a request to a particular *route*. So to start off, we'll start with a route. Let's create one now in `config/routes.rb`:

```ruby
Rails.application.routes.draw do
  get "/articles", to: "articles#index"

  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html
end
```

This is your application's *routing file* which holds entries in a special [DSL](https://en.wikipedia.org/wiki/Domain-specific_language) (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions.

The line that we have just added says that we are going to match a `GET /welcome` request to `welcome#index`. This string passed as the to option represents the *controller* and *action* that will be responsible for handling this request.

Controllers are classes that group together common methods for handling a particular *resource*. The methods inside controllers are given the name "actions", as they *act upon* requests as they come in.

To create a new controller, you will need to run the "controller" generator and tell it you want a controller called "articles" with an action called "index", just like this:
```
❯ bin/rails generate controller articles index
```

Rails will create several files and a route for you.

```
create app/controllers/articles_controller.rb
 route get 'articles/index'
invoke erb
create  app/views/articles
create  app/views/articles/index.html.erb
invoke test_unit
create  test/controllers/articles_controller_test.rb
invoke helper
create  app/helpers/articles_helper.rb
invoke assets
invoke  scss
create    app/assets/stylesheets/articles.scss
```

Most important of these are of course the controller, located at `app/controllers/welcome_controller.rb` and the view, located at `app/views/welcome/index.html.erb`.

Let's look at that controller now:

```ruby
class ArticlesController < ApplicationController
  def index
  end
end
```

This controller defines a single action, or "method" in common Ruby terms, called `index`. This action is where we would define any logic that we would want to happen when a request comes in to this action. Right at this moment, we don't want this action to do anything, and so we'll keep it blank for now.

When an action is left blank like this, Rails will default to rendering a view that matches the name of the controller, and the name of the action. That view is going to be `app/views/articles/index.html.erb`.

Open the `app/views/welcome/index.html.erb` file in your text editor. Delete all of the existing code in the file, and replace it with the following single line of code:

```html
<h1>Hello, Rails!</h1>
```

If we go back to our browser and make a request to `http://localhost:3000/articles`, we'll see our text appear on the page.

### Setting the Application Home Page

Now that we have made the route, controller, action and view, let's make a small change to our routes.
In this application, we're going to change it so that our message appears at `http://localhost:3000/` and not just `http://localhost:3000/articles`. At the moment, at `http://localhost:3000` it still says "Yay! You're on Rails!".

To change this, we need to tell our routes file where the root path of our application is.
Open the file `config/routes.rb` in your editor and add this line

```ruby
root to: "articles#index"
```

Or, a slightly shorter way of writing the same thing is:
```ruby
Rails.application.routes.draw do
  get "/articles", to: "articles#index"

  root "articles#index"
end
```

This `root` method defines a root path for our application. The root method tells Rails to map requests to the root of the application to the `ArticlesController` `index` action.

Launch the web server again if you stopped it to generate the controller *(rails server)8 and navigate to `http://localhost:3000` in your browser. You'll see the "Hello, Rails!" message you put into `app/views/articles/index.html.erb`, indicating that this new route is indeed going to `ArticlesController`'s `index` action and is rendering the view correctly.

## Creating a model

So far, we have seen routes, controllers, actions and views within our Rails application. All of these are conventional parts of Rails applications and it is done this way to follow the MVC pattern. The MVC pattern is an application design pattern which makes it easy to separate the different responsibilities of applications into easy to reason about pieces.
So with "MVC", you might guess that the "V" stands for "View" and the "C" stands for controller, but you might have trouble guessing what the "M" stands for. This next section is all about that "M" part, the *model*.

A model is a class that is used to represent data in our application. In a plain-Ruby application, you might have a class defined like this:

```ruby
class Article
  attr_reader :title, :body

  def initialize(title:, body:)
    @title = title
    @body = body
  end
end
```
Models in a Rails application are designed for this purpose too: to represent particular data.

Models have another purpose in a Rails application too though. They're also used to interact with the application's database. In this section, we're going to use a model to put data into our database and to pull that data back out.

To start with, we're going to need to generate a model. We can do that with the following command:

```
❯ rails generate model article title:string body:text
```

**NOTE**: The model name here is *singular*, because model classes are classes that are used to represent single instances. To help remember this rule, in a Ruby application to start building a new object, you would define the class as `Article`, and then do `Article.new`, not Articles and Articles.new.

When this command runs, it will generate the following files:

```
invoke active_record
create  db/migrate/[timestamp]_create_articles.rb
create  app/models/article.rb
invoke test_unit
create  test/models/article_test.rb
create  test/fixtures/articles.yml
```

The two files we'll focus on here are the migration (the file at `db/migrate`) and the model.

A migration is used to alter the structure of our database, and it is written in Ruby. Let's look at this file now, `db/migrate/[timestamp]_create_articles.rb`.

```ruby
class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
```

This file contains Ruby code to create a table within our application's database. Migrations are written in Ruby so that they can be database-agnostic -- regardless of what database you use with Rails, you'll always write migrations in Ruby.

Inside this migration file, there's a `create_table` method that defines how the articles table should be constructed. This method will create a table in our database that contains an id auto-incrementing primary key. That means that the first record in our table will have an id of 1, and the next id of 2, and so on. Rails assumes by default this is the behavior we want, and so it does this for us.

Inside the block for `create_table`, we have two fields, `title` and `body`. These were added to the migration automatically because we put them at the end of the rails g model call:

```
❯ rails generate model article title:string body:text
```

On the last line of the block is `t.timestamps`. This method defines two additional fields in our table, called created_at and updated_at. When we create or update model objects, these fields will be set respectively.

The structure of our table will look like this:

id | title | body | created_at | updated_at
---|---|---|---|---
*|*|*|*|*

To create this table in our application's database, we can run this command:
```
❯ rails db:migrate
```

This command will show us output indicating that the table was created:
```
== 20200118233119 CreateArticles: migrating ===================================
-- create_table(:articles)
-> 0.0018s
== 20200118233119 CreateArticles: migrated (0.0018s) ==========================
```

Now that we have a table in our application's database, we can use the model to interact with this table.

To use the model, we'll use a feature of Rails called the `console`. The `console` allows us write code like we might in `irb`, but the code of our application is available there too.

Let's launch the console with this command:
```
❯ rails console
```

Or, a shorter version
```
❯ rails c
```

When we launch this, we should see an irb prompt:
```
Loading development environment (Rails 6.0.2.1)

irb(main):001:0>
```

In this prompt, we can use our model to initialize a new Article object:
```
irb(main):001:0> article = Article.new(title: "Hello Rails", body: "I am on Rails!")
```

When we use `Article.new`, it will initialize a new Article object in the console. This object is not saved to the database at all, it's just available in the console so far.

To save the object to the database, we need to call save:
```
irb(main):002:0> article.save
```

This command will show us the following output:
```
(0.1ms) begin transaction
Article Create (0.4ms) INSERT INTO "articles" ("title", "body", "created_at", "updated_at") VALUES (?, ?, ?, ?) [["title", "Hello Rails"], ["body", "I am on Rails!"], ["created_at", "2020-01-18 23:47:30.734416"], ["updated_at", "2020-01-18 23:47:30.734416"]] (0.9ms) commit transaction
=> true
```

This output shows an `INSERT INTO "articles"...` database query. This means that our article has been successfully inserted into our table.

If we take a look at our article object again, an interesting thing has happened:
```
irb(main):003:0> article
=> #<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">
```

Our object now has the `id`, `created_at` and `updated_at` fields set. All of this happened automatically for us when we saved this article.

If we wanted to retrieve this article back from the database later on, we can do that with find, and pass that id as an argument:
```
irb(main):004:0> article = Article.find(1)
=> #<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">
```

A shorter way to add articles into our database is to use Article.create, like this:
```
irb(main):005:0> Article.create(title: "Post #2", body: "Still riding the Rails!")
```

This way, we don't need to call `new` and then `save`.

Lastly, models provide a method to find all of their data:
```
irb(main):006:0> articles = Article.all
#<ActiveRecord::Relation [#<Article id: 1, title: "Hello Rails", body: "I am on Rails!", created_at: "2020-01-18 23:47:30", updated_at: "2020-01-18 23:47:30">, #<Article id: 2, title: "Post #2", body: "Still riding the Rails!", created_at: "2020-01-18 23:53:45", updated_at: "2020-01-18 23:53:45">]>
```

This method returns an `ActiveRecord::Relation` object, which you can think of as a super-powered array. This array contains both of the topics that we have created so far.

As you can see, models are very helpful classes for interacting with databases within Rails applications. Models are the final piece of the "MVC" puzzle. Let's look at how we can go about connecting all these pieces together into a cohesive whole.

## Getting Up and Running

Now that you've seen how to create a route, a controller, an action, a view and a model, let's connect these pieces together.

Let's go back to `app/controllers/articles_controller.rb` now. We're going to change the index action here to use our model.
```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
end
```

Controller actions are where we assemble all the data that will later be displayed in the view. In this index action, we're calling `Article.all` which will make a query to our database and retrieve all of the articles, storing them in an instance variable: `@articles`.

We're using an instance variable here for a very good reason: instance variables are automatically shared from controllers into views. So to use this `@articles` variable in our view to show all the articles, we can write this code in `app/views/articles/index.html.erb`:
```html
<h1>Articles</h1>
<ul>
<% @articles.each do |article| %>
  <li><%= article.title %></li>
<% end %>
</ul>
```

We've now changed this file from using just HTML to using HTML and ERB. ERB is a language that we can use to run Ruby code.

There's two types of ERB tag beginnings that we're using here: `<%` and `<%=`. The `<%` tag means to evaluate some Ruby code, while the `<%=` means to evaluate that code, and then to output the return value from that code.

In this view, we do not want the output of `articles.each` to show, and so we use a `<%`. But we do want each of the articles' titles to appear, and so we use `<%=`.

When we start an ERB tag with either `<%` or `<%=`, it can help to think "I am now writing Ruby, not HTML". Anything you could write in a regular Ruby program, can go inside these ERB tags.

When the view is used by Rails, the embedded Ruby will be evaluated, and the page will show our list of articles. Let's go to `http://localhost:3000` now and see the list of articles:

![Article list](./images/article_list.png)

---

If we look at the source of the page in our browser `http://localhost:3000/`, we'll see this part:
```html
<h1>Articles</h1>

<ul>
  <li>Hello Rails</li>
  <li>Post #2</li>
</ul>
```

This is the HTML that has been output from our view in our Rails application. Here's what's happened to get to this point:
1. Our browser makes a request: GET `http://localhost:3000`.
2. The Rails application receives this request.
3. The router sees that the root route is configured to route to the `ArticlesController`'s *index* action.
4. The index action uses the `Article` model to find all the articles.
5. Rails automatically renders the `app/views/articles/index.html.erb` view.
6. The view contains ERB (Embedded Ruby). This code is evaluated, and plain HTML is returned.
7. The server sends a response containing that plain HTML back to the browser.

---
![Application Flowchart](./images/application_flowchart.png)

Full size [chart](https://drive.google.com/a/slicelife.com/file/d/1wKnbJSywrLK5nvpat949lsaqAiRmCJr4/view?usp=sharing)

---

We've now successfully connected all the different parts of our Rails application together: the router, the controller, the action, the model and the view. With this connection, we have finished the first action of our application.

Let's move on to the second action!

## Viewing an Article

For our second action, we want our application to show us the details about an article, specifically the article's title and body:
```
Hello Rails

I am on Rails!
```

We'll start in the same place we started with the index action, which was in `config/routes.rb`. We'll add a new route for this page.

Let's change our routes file now to this:
```ruby
Rails.application.routes.draw do
  root "articles#index"
  get "/articles", to: "articles#index"
  get "/articles/:id", to: "articles#show"
end
```

This route is another *get* route, but it has something different in it: `:id`. This syntax in Rails routing is called a *parameter*, and it will be available in the *show* action of `ArticlesController` when a request is made.

A request to this action will use a route such as `http://localhost:3000/articles/1` or `http://localhost:3000/articles/2`.

This time, we're still routing to the `ArticlesController`, but we're going to the *show* action of that controller instead of the *index* action.

Let's look at how to add that *show* action to the `ArticlesController`. We'll open `app/controllers/articles_controller.rb` and add it in, under the index action:

```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end
end
```

When a request is made to this `show` action, it will be made to a URL such as `http://localhost:3000/articles/1`. Rails sees that the last part of that route is a dynamic parameter, and makes that parameter available for us in our controller through the method params. We use` params[:id]` to access that parameter, because back in the routes file we called the parameter `:id`. If we used a name like `:article_id` in the routes file, then we would need to use `params[:article_id]` here too.

The show action finds a particular article with that ID. Once it has that, it needs to then display that article's information, which will do by attempting to use a view at `app/views/articles/show.html.erb`. Let's create that file now and add this content:
```html
<h1><%= @article.title %></h1>

<p><%= @article.body %></p>
```

Now when we go to http://localhost:3000/articles/1 we will see the article:

![Article Show](./images/article_show.png)
---

But in order to navigate to it, we have to manually type in `http://localhost:3000/articles/1`. That seems a bit silly. Let's change our application a little, so that we can navigate to an article by clicking a link from the list of articles.

To add the link to an article, we need to change `app/views/articles/index.html.erb`:
```html
<h1>Articles</h1>

<ul>
  <% @articles.each do |article| %>
    <li>
      <a href="articles/<%= article.id %>">
        <%= article.title %>
      </a>
    </li>
  <% end %>
</ul>


```

This a tag will provide us with a link to the specific article. If we go back to
`http://localhost:3000/`, we'll see that we can now click on the articles:

![Articles with links](./images/articles_list_with_links.png)

Clicking either of these links will take us to the relevant article.

Rails has a method called `link_to` that can make that linking a little simpler. Let's use this in `app/views/articles/index.html.erb`:
```html
<h1>Articles</h1>

<ul>
  <% @articles.each do |article| %>
    <li>
      <%= link_to article.title, "/articles/#{article.id}" %>
    </li>
  <% end %>
</ul>
```

There we go, that is now a little bit cleaner. Rails has given us a way to shorten this code a little. But what you don't know yet is that this line can be made even simpler.

Rails has a feature called `routing helpers`. These are methods that can be used to
generate route paths like "/articles/#{article.id}" programatically. We'll use one of these to generate the route for our article.

To set this up, let's go back to `config/routes.rb` and change this line:
```ruby
get "/articles/:id", to: "articles#show"
```

To this:
```ruby
get "/articles/:id", to: "articles#show", as: :article
```

The `:as` option here tells Rails that we want routing helpers for this article route to be available in our application. Rails will then let us use this helper to build that route.

Let's look at how we can use that in `app/views/articles/index.html.erb` now, by changing the end of the `link_to` call to this:
```html
<h1>Articles</h1>

<ul>
  <% @articles.each do |article| %>
    <li>
      <%= link_to article.title, article_path(article) %>
    </li>
  <% end %>
</ul>
```

The `link_to` now assembles its path using the `article_path` helper. This will still generate the same `/articles/:id` route we used earlier, but now it happens programatically instead. Now there is not so much switching happening between HTML and Ruby in this code. We enter Ruby, generate a link, and exit Ruby. The code still does the same thing: it links an article's title to the show page for that article.

We now have an `index` action that lists the articles, and a `show` action that shows the title and body for a specific article. Before we move on, we'll make one more little change: we'll add a "Back" link in `app/views/articles/show.html.erb`:
```html
<h1> <%= @article.title %> </h1>

<p> <%= @article.body %> </p>

<%= link_to "Back", root_path %>
```

This will allow us to navigate back to the list of articles easily. The `root_path` comes also from router helper, which is accessible only if define `root to: ''` option in th routes.rb file.

With that small change done, let's now look at how we can create new articles within this application.

## Creating new article

To have a place to create new articles in our application, we're going to need create a new route, action and view.

We start with the `routes.rb` file to set-up the route:
```ruby
Rails.application.routes.draw do
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new', as: :new_article
  get '/articles/:id', to: 'articles#show', as: :article

  root to: 'articles#index'
end
```

The resource to create new articles will be `/articles/new,` and the route for this has very intentionally been placed above the route for the show action. The reason for this is because routes in a Rails application are matched **top-to-bottom**. If we had `/articles/:id` first, that route would match `/articles/new`, and so if we went to `/articles/new`, the show action would serve that request, not the new action. And so for this reason, we put the new route above the show action.

This `/articles/new` route will send the request to the `new` action within the `ArticlesController`, which we'll see in a minute. We've added the `:as` option here, as we will be using the `new_article_path` helper in a little while to provide a way to navigate to this form.

Next is to define the action inside the controller:
```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end
end
```

We can put the new action under show in the controller, because the order of methods in classes doesn't matter in Ruby.

The last think to successfully complete the route is to create the view, `new.html.erb` file under the `app/views` directory:

```html
<h1> New Article </h1>
```

To create a form within this template, you will use a *form builder*.
```html
<form action="/articles" method="post">
  <p>
    <label for="title">Title</label><br>
    <input type="text" id="title" name="title" />
  </p>

  <p>
    <label for="text">Text</label><br>
    <textarea name="text" id="text"></textarea>
  </p>

  <p>
    <input type="submit" value="Save Article" />
  </p>
</form>
```
This is an awful lot of typing for building a form. Fortunately, Rails provides helpers for us to simplify matters.

The primary form builder for Rails is provided by a helper method called `form_with`. To use this method, add this code into `app/views/articles/new.html.erb`:
```html
<h1>New Article</h1>

<%= form_with scope: :article, local: true do |form| %>
  <p>
    <%= form.label :title %>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :body %>
    <%= form.text_area :body %>
  </p>

  <p>
    <%= form.submit "Save Article" %>
  </p>
<% end %>
```

The `form_with` helper method allows us to *build* a form. The first line of this provides us a block argument called `form`, and then throughout the `form` we use that to build labels and text inputs for our field.

*NOTE*: By default `form_with` submits forms using *Ajax* thereby skipping full page redirects. To make this guide easier to get into we've disabled that with `local: true` for now.

This ERB code that uses `form_with` will output a HTML form that looks very similar to the one we hand-rolled, but there are some key differences. Here's what the `form_with` outputs:

```html
<form action="/articles/new" accept-charset="UTF-8" method="post">
  <input type="hidden" name="authenticity_token" value="DIwa34..." />

  <p>
    <label for="article_title">Title</label><br>
    <input type="text" name="article[title]" id="article_title" />
  </p>

  <p>
    <label for="article_text">Text</label><br>
    <textarea name="article[text]" id="article_text">
    </textarea>
  </p>

  <p>
    <input type="submit" name="commit" value="Save Article" />
  </p>
</form>
```
The first key difference is that there is a hidden field called `authenticity_token` at the top. This is a security feature of Rails and it prevents outside people from submitting your forms maliciously using a technique called *Cross Site Request Forgery*.

The labels and fields are mostly the way they were, with a key difference: the `name` fields have an `article[]` wrapping around their values. This wrapping comes from the `scope` argument that we have passed to `form_with`. This wrapping groups all the fields of the form into one hash once they're submitted, and that will make it easy to process once they reach our application.

There's one problem with this form though. If you inspect the HTML that is generated, by viewing the source of the page, you will see that the action attribute for the form is pointing at `/articles/new`.
This is a problem because this route goes to the very page that you're on right at the moment, and that route should only be used to display the form for a new article.

The form needs to use a different URL in order to go somewhere else. This can be done quite simply with the `:url` option of `form_with`. Typically in Rails, the action that is used for *new* form submissions like this is called "create", and so
the form should be pointed to that action.

Edit the `form_with` line inside `app/views/articles/new.html.erb` to look like this:
```ruby
<%= form_with scope: :article, url: "/articles", local: true do |form| %>
```

Once the form is submitted, it will send a POST request to `/articles`. If we hit submit on that form now, we'll be shown a *Routing Error*. This error means that we haven't set up a route to handle POST requests to `/articles`. Let's add this new route:
```ruby
Rails.application.routes.draw do
  get '/articles', to: 'articles#index'
  get '/articles/new', to: 'articles#new', as: :new_article
  get '/articles/:id', to: 'articles#show', as: :article
  post '/articles', to: 'articles#create'

  root to: 'articles#index'
end
```

**TIP**: The get and post methods that we use in config/routes.rb match HTTP request methods. These methods are conventions used across all HTTP applications -- not just Rails! -- to clearly indicate what sort of action we want to do. A *GET* request is one that retrieves information. A *POST* request is one that adds information.

When Rails receives a POST `/articles` request, it will now route that request to the create action of the `ArticlesController`.
You now need to create the create action within the `ArticlesController` for this to work.

## Creating Article

We can define a create action within the `ArticlesController` class in `app/controllers/articles_controller.rb`, underneath the new action, as shown:
```ruby
class ArticlesController < ApplicationController
  def new
  end

  def create
  end
end
```

If you re-submit the form now, you may not see any change on the page. Don't worry!

![New Article Form](./images/new_article_form.png)

This is because Rails by default returns *204 No Content* response for an action if we don't specify what the response should be. We just added the create action but didn't specify anything about how the response should be. In this case, the create action should save our new article to the database.

When a form is submitted, the fields of the form are sent to Rails as *parameters*. Yes, there are the same parameters as we saw earlier when we used `params[:id]`. These parameters can then be referenced inside the controller actions, typically to perform a particular task. To see what these parameters look like, change the create action to this:
```ruby
def create
  render plain: params[:article].inspect
end
```

The render method here is taking a very simple hash with a key of `:plain` and value of params`[:article].inspect`. The params method is the object which represents the parameters (or fields) coming in from the form. The params method returns an `ActionController::Parameters` object, which allows you to access the keys of the hash using either strings or symbols. In this situation, the only parameters that matter are the ones from the form. Thanks to the use of the `scope` option on the form, all of our form's parameters are grouped under `params[:article]`.

If you re-submit the form one more time, you'll see something that looks like the following:
```ruby
<ActionController::Parameters
    {"title"=>"Article the Third", "text"=>"The Trilogy Ends"}
    permitted: false>
```

This action is now displaying the parameters for the article that are coming in from the form. However, this isn't really all that helpful. Yes, you can see the parameters but nothing in particular is being done with them.

Let's change the create action to use the `Article` model to save the data in the database. Let's change the create action to look like this:
```ruby
def create
  article = Article.new(params[:article])
  article.save

  redirect_to article_path(article)
end
```

*NOTE*: We're not using an instance variable in this action. This is because this action redirects at the end, and since there is a redirection there is no view. So there is no need to make these variables instance variables.

Here we use some familiar code to create a new article -- we saw this previously right after we generated the `Article` model. The call to `new` and then to `save` will create a new article record in the database.

The final line, a `redirect_to`, uses `article_path` to redirect back to the show action.

If you now go to `http://localhost:3000/articles/new` you'll almost be able to create an article. Try it! You should get an error that looks like this:

![Forbidden Attribute Error](./images/forbidden_attribute_error.png)

Rails has several security features that help you write secure applications, and you're running into one of them now. This one is called *strong parameters*, which requires us to tell Rails exactly which parameters are allowed into our controller actions.

Why do you have to bother? The ability to grab and automatically assign all controller parameters to your model in one shot makes the programmer's job easier, but this convenience also allows malicious use. What if this form was a bank account and we allowed just anyone to add in a new field that set their balance to whatever they wished? This would end up bad for us!

We have to define our permitted controller parameters to prevent wrongful mass assignment. In this case, we want to both allow and require the `title` and `body` parameters for valid use of `create`. The syntax for this introduces `require` and `permit`. The change will involve one line in the `create` action:
```ruby
  @article = Article.new(params.require(:article).permit(:title, :body))
```

This code is quite long and is often pulled out into its own method so it can be reused by multiple actions in the same controller. Above and beyond mass assignment issues, the method is often made `private` to make sure it can't be called outside its intended context. Here is the result:
```ruby
def create
  article = Article.new(article_params)
  article.save

  redirect_to article_path(article)
end

private

def article_params
  params.require(:article).permit(:title, :body)
end
```

If we attempt to submit our form once more, this time it will succeed and we'll see the article's title and body. The URL should be `http://localhost:3000/articles/3`, indicating that we're now on the `show` action.

Before we wrap up this section, let's add a link to `app/views/articles/index.html.erb` so that we can go to the "New Article" page from there:
```html
<h1>Articles</h1>

<%= link_to "New Article", new_article_path %>

.
.
(the rest of the code)
```

Great! That's another two actions finished in our controller: `new` and `create`.

## Adding Model Validation

Sometimes, in web applications, we want to make sure certain fields are filled in.

The model file, `app/models/article.rb` is about as simple as it can get:
```ruby
class Article < ApplicationRecord
end
```

There isn't much to this file - but note that the `Article` class inherits from `ApplicationRecord`. `ApplicationRecord` inherits from `ActiveRecord::Base` which supplies a great deal of functionality to your Rails models for free. We've used some of this already: `Article.new`, `Article.all`, `Article.find` and so on.

One of these pieces of functionality is that *Active Record* includes methods to help you validate the data that you send to models and it's easy to use.

Open the app/models/article.rb file and edit it to this:
```ruby
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
end
```

These changes will ensure that all articles have a *title* that is at least five characters long. Rails can validate a variety of conditions in a model, including the presence or uniqueness of columns, their format, and the existence of associated objects. Validations are covered in detail in *Active Record Validations*.

This validation will now only let us save articles that have titles longer than 5 characters. Let's open up the console now and try:
```
❯ rails console
irb(main):001:0> invalid_article = Article.new
=> #<Article id: nil, title: nil, body: nil, created_at: nil, updated_at: nil>
irb(main):002:0> invalid_article.save
=> false
```

When `save` returns false, it means that the object is invalid and won't be saved to the database. To find out why, we can use this code:
```
irb(main):003:0> invalid_article.errors.full_messages
=> ["Title can't be blank", "Title is too short (minimum is 5 characters)"]
```

The `errors.full_messages` method chain shows two validation failure messages for our model:
- The title can't be blank
- The title is too short (minimum of 5 characters)

That's because we've left the title blank. Now let's see what happens when we save an article with a valid title:
```
irb(main):006:0> article = Article.new title: "Getting Started"
=> #<Article id: nil, title: "Getting Started", body: nil, created_at: nil, updated_at: nil>

irb(main):007:0> article.save
(0.1ms) begin transaction
Article Create (0.4ms) INSERT INTO "articles" ("title", "created_at", "updated_at") VALUES (?, ?, ?) [["title", "Getting Started"], ["created_at", "2020-05-07 09:56:25.693465"], ["updated_at", "2020-05-07 09:56:25.693465"]]
(0.6ms) commit transaction
=> true
```

The *save* call here has returned true, indicating that the article has passed validations. Also in the console, we can see an `Article Create` message, that contains an `INSERT INTO` database query, and so we can be confident that this article has now been inserted into our database.

Now that we've seen how to handle invalid and valid articles in the console, let's try using this same technique in our controller.

If you open `app/controllers/articles_controller.rb` again, you'll notice that we don't check the result of calling `@article.save` inside the create action.

If `@article.save` fails in this situation, we need to do something different: we need to show the form again to the user so that they can correct their mistake.
To do this, let's change the create action to either redirect to the article if the save was successful (the method returns true) or to show the new form again if the save failed:
```ruby
def new
end

def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render :new
  end
end
```

The first thing to note here is that we've now switched from using a local variable article to using an instance variable, `@article`. The reason for this is the else statement. Inside that else we tell Rails to render `:new`. This tells Rails that we want the `app/views/articles/new.html.erb` view to be rendered in the case where our save fails.

Next is to to display the errors. To do that, we'll need to modify `app/views/articles/new.html.erb` to check for error messages. Add this after the header HTML element:
```html
<h1> New Article </h1>

<% if @article.errors.any? %>
<div id="error_explanation">
  <h2>
    <%= pluralize(@article.errors.count, "error") %> prohibited
      this article from being saved:
  </h2>
  <ul>
    <% @article.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
    <% end %>
  </ul>
</div>
<% end %>

... rest of the html
```

At the top of this view, we're now using `@article.errors` to check for any errors. The `@article` variable here will come from the *create* action, when the `app/views/articles/new.html.erb` view is rendered due to an invalid article.

Inside the check for any errors, we call `pluralize`. `pluralize` is a rails helper that takes a number and a string as its arguments. If the number is greater than one, the string will be automatically pluralized.

If we attempt to go to `http://localhost:3000/articles/new` at this point, we'll see it fail:

![New Article: NoMethodError](./images/new_article_no_method_error.png)

This is happening because we're referring to a variable called `@article` within `app/views/articles/new.html.erb`, but the `new` action does not provide this variable at all.

The path to this error is:
  1. Browser goes to `http://localhost:3000/articles/new`
  2. Rails sees `/articles/new` is the route, routes the request to the
  `ArticlesController`'s new action
  3. The *new* action is blank, and so Rails defaults to rendering
  `app/views/articles/new.html.erb`.
  4. The template attempts to reference `@article,` but it is not defined.

So to make this error go away, we need to define this @article variable.
We can do it like this in the new action inside app/controllers/articles_controller.rb:
```ruby
def new
  @article = Article.new
end
```

This @article is a brand-new `Article` object, and will be perfect for our form. It doesn't have any errors on it -- because we haven't tried saving it yet! -- and so the form will not display any errors.

If we refresh this `http://localhost:3000/articles/new` page, we should see our form renders once again.

And there we have it! We now have the ability to create new articles within our application.

## Updating Articles

Now what should happen if we make a mistake when creating an article? Well, we should have a way to edit an article and correct that mistake.

Our edit form will look just like our new form, just with a few differences: the title will say "Edit Article", not "New Article". Secondly, the fields will be filled out with the article's current values. And lastly, the submit button says "Update Article", not "Save Article".

To add this feature to our application, we're going to need to add a new route, a route just for editing articles. Let's do this now in `config/routes.rb`:
```ruby
get "/articles/:id/edit", to: "articles#edit", as: :edit_article
```

This new route is another `get` route. This time, we're routing to `/articles/:id/edit`, so that we can see that edit form for a particular article. Which article we're editing depends on that `:id` parameter in the route.

The route will be handled by the `edit` action within `ArticlesController`. We'll add that action soon.
The `as` option will provide us with a routing helper that we can use across our application to take us to this edit form for a specific article.

As a first step, let's add an "Edit" link for each article on `app/views/articles/index.html.erb`:
```html
<h1>Articles</h1>

<%= link_to "New Article", new_article_path %>

<ul>
  <% @articles.each do |article| %>
    <li>
      <%= link_to article.title, article_path(article) %>
      <%= link_to "Edit" , edit_article_path(article) %>
    </li>
  <% end %>
</ul>
```

This "Edit" link will now appear next to all of the articles at `http://localhost:3000/articles`.

Next step here is to add that action to our controller. Let's open `app/controllers/articles_controller.rb` and add that action:
```
def edit
  @article = Article.find(params[:id])
end
```

**NOTE**: We're using *edit* to render just a form to display the current values of the article. For the actual updating of the article, we'll use a different action for this shortly called *update*.

The view will contain a form similar to the one we used when creating *new* articles. Create a file called `app/views/articles/edit.html.erb` and put this content inside:
```html
<h1>Edit Article</h1>

<% if @article.errors.any? %>
  <div id="error_explanation">
    <h2>
      <%= pluralize(@article.errors.count, "error") %> prohibited
        this article from being saved:
    </h2>
    <ul>
      <% @article.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
      <% end %>
    </ul>
  </div>
<% end %>

<%= form_with model: @article, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :body %><br>
    <%= form.text_area :body %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>

<%= link_to 'Back', articles_path %>
```

The only things different in this view are the `<h1>` at the top of the view, and the `form_with`. The `form_with` is not using `scope` or `url`, but is instead using a different key called `model`.

The `model` key for `form_with` takes an instance of a model's class and builds a form for that particular object. By using `form_with` in this way, Rails will pre-populate the `title` and `body` fields in this form for us.

There's one extra feature that Rails does for us that is not immediately obvious from looking at the form itself. This feature requires us to look at the HTML source of this form. Inside this source at the top of the `<form>` element, here's what we'll see:
```html
<form action="/articles/1" accept-charset="UTF-8" method="post">
  <input type="hidden" name="_method" value="patch" />
```

Firstly, the action attribute for this form goes to a route called `/articles/1`. This path was automatically generated by Rails; in short: it uses the `article_path` helper to generate this route. The second thing to notice is that hidden field. This hidden field is a special field that will make the form do a *PATCH* request when this form is submitted, instead of the default *POST* (as is configured in the form element's method attribute).

This means that our form will make a `PATCH /articles/1` request when it is submitted. If we hit submit on the form, we'll see that this is correct, and that this route is currently missing:

![Article Patch Error](./images/patch_article_error.png)

This route is supposed to handle the submission of our form, but the route does not exist yet. To make this form work, we'll need to define this route. Let's go back to `config/routes.rb` and define this route:
```ruby
Rails.application.routes.draw do
  root "articles#index"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new", as: :new_article
  get "/articles/:id", to: "articles#show", as: :article
  post "/articles", to: "articles#create"
  get "/articles/:id/edit", to: "articles#edit", as: :edit_article
  patch "/articles/:id", to: "articles#update"
end
```

This patch method will generate us a route for `PATCH /articles/:id` requests. We use the *PATCH HTTP* routing method for when we want to modify an existing resource.

These requests to PATCH `/articles/:id` will be routed to the update action in our `ArticlesController`. Let's add that action now underneath the edit action:

```ruby
def edit
  @article = Article.find(params[:id])
end

def update
  @article = Article.find(params[:id])

  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
```

The new method, `update`, is used when you want to update a record that already exists, and it accepts a hash containing the attributes that you want to update. As before, if there was an error updating the article we want to show the form back to the user.

We reuse the `article_params` method that we defined earlier for the `create` action. We want to accept the same parameters here, and so it makes sense to use the same `article_params` method.

*TIP*: It is not necessary to pass all the attributes to update. For example, `if @article.update(title: 'A new title')` was called, Rails would only update the title attribute, leaving all other attributes untouched.

Let's try this again. We'll go to `http://localhost:3000`, click the "Edit" link next to one of the articles and change its title. When this happens and we submit the form, we will see the new title for that article.

On this page, we're currently missing a way to edit an article. This route that we're currently on is `http://localhost:3000/articles/1`, and we know that the route matches to `app/views/articles/show.html.erb`. In this file we can add a link to edit the article:
```html
<%= link_to "Edit", edit_article_path(@article) %>
```

This now finishes our adventures in adding the ability to edit an article in this application.

## Using partials to clean up duplication in views

Our *edit* page looks very similar to the *new* page; in fact, they both share almost same code for displaying the form. Rails has yet another great feature that we can use to reduce this duplication and this feature is called *partials*.

Partials allow us to extract out common pieces of views into a file that is then shared across many different views, or in this case, just two views. Let's remove this duplication by using a partial. By convention, partial files are prefixed with an underscore.

Create a new file `app/views/articles/_form.html.erb`. We're going to copy most of `app/views/articles/edit.html.erb` into this new partial file:
```html
<% if article.errors.any? %>
  <div id="error_explanation">
    <h2>
      <%= pluralize(article.errors.count, "error") %> prohibited
        this article from being saved:
    </h2>
    <ul>
      <% article.errors.full_messages.each do |msg| %>
      <li><%= msg %></li>
      <% end %>
    </ul>
  </div>
<% end %>

<%= form_with model: article, local: true do |form| %>
  <p>
    <%= form.label :title %><br>
    <%= form.text_field :title %>
  </p>

  <p>
    <%= form.label :body %><br>
    <%= form.text_area :body %>
  </p>

  <p>
    <%= form.submit %>
  </p>
<% end %>
```

This partial can now be used in both the *new* and *edit* views. Let's update the new view:
```ruby
<h1>New Article</h1>

<%= render 'form', article: @article %>
```

Then do the same for the `app/views/articles/edit.html.erb` view:
```ruby
<h1>Edit Article</h1>

<%= render 'form', article: @article %> <%= link_to 'Back', articles_path %>
```

This *render* call in a view works differently to the *render* call in a controller. Back in the create action for `ArticlesController`, we have this:
```ruby
def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render 'new'
  end
end
```

This `render` method call will render a view, not a partial. In this case, it will render the `app/views/articles/new.html.erb` view.

But when we call `render` inside a view, it will render a partial. When we call `render 'form', article: @article` inside our `new.html.erb` and `edit.html.erb` views, this will render the `app/views/articles/_form.html.erb partial`. How does Rails know that we want this particular form partial? It assumes we want the one in the same directory as the current view by default. This is another one of Rails' conventions at work!

The `article: @article` syntax at the end of this line tells Rails that we want to pass the instance variable `@article` to the partial as a *local* variable called `article`.

Inside that partial, we can access whatever the current article is by using the `article` local variable.
Now, an interesting thing happens here. When this partial is rendered for the *new* action, the form will submit to the *create* action. But when it's rendered for the *edit* action, it will submit to the *update* action. Go ahead and try it.
How can one piece of code do two things? The way this works lies in the magic of `form_with` and what it outputs, depending on its model option.

When this partial is rendered by the new action, the @article variable is set like this:
```ruby
def new
  @article = Article.new
end
```

The `form_with` helper from Rails detects that this object hasn't yet been saved to the database, and therefore assumes we want to display a form for creating a new article.
If you look at the HTML source from `http://localhost:3000/articles/new`, you'll see the form is configured like this:
```html
<form action="/articles" accept-charset="UTF-8" method="post">
```

When the form is submitted, it will make a `POST /articles` request. This will go to the create action in `ArticlesController`, because that's how our routes are configured:
```ruby
post "/articles", to: "articles#create"
```

Over in the *edit* action, we instead set `@article` like this:
```ruby
def edit
  @article = Article.find(params[:id])
end
```

This `@article` represents an article that has already been saved to the database, and so `form_with` behaves different. Let's look at the HTML source from` http://localhost:3000/articles/1/edit` and see:
```html
<form action="/articles/1" accept-charset="UTF-8" method="post">
  <input type="hidden" name="_method" value="patch" />
```

This is the same `form_with` method call that is running, but it is acting differently. This time, the form is generated with an action of `/articles/1`. The hidden field called `_method` will make Rails do a `PATCH /articles/1` request. If we look in our routes file, we'll see that such a request goes to the update action:
```ruby
patch "/articles/:id", to: "articles#update"
```

This is no coincidence. We have chosen these routes very specifically so that we can follow Rails conventions. The `form_with` helper acts differently depending on if the `@article` has been saved or not, and so we can use this one partial to represent a form in either `new.html.erb` or `edit.html.erb`.

Partials are a very handy feature of Rails that we can use to remove duplication between separate views. And combining them with `form_with` allows us to merge together two forms into one, without sacrificing any of our sanity.

## Deleting Articles

We're now able to see, create, and update articles within our application. The final part that we'll cover for articles in this guide is how to delete them.

In order to edit articles, we provided a link right next to the article's title in app/views/articles/index.html.erb. To delete articles, let's do the same thing:
```html
<h1>Articles</h1>
<%= link_to "New Article", new_article_path %>

<ul>
  <% @articles.each do |article| %>
    <li>
      <%= link_to article.title, article_path(article) %>
      <%= link_to "Edit", edit_article_path(article) %>
      <%= link_to "Delete", article_path(article) %>
    </li>
  <% end %>
</ul>
```

This `link_to` won't delete the article. It will instead take us to the show action in `ArticlesController` and `show` us the article itself. We need to add one extra thing to this link, which is a method option:
```html
<%= link_to "Delete", article_path(article), method: :delete %>
```

This will make the link make a` DELETE /articles/:id` request. The DELETE HTTP method is one that we use when we want to delete things.

We can now refresh this page and click one of these "Delete" links. This request currently won't work, because we don't have a DELETE `/articles/:id` route set up. Let's add this route to `config/routes.rb`:
```ruby
Rails.application.routes.draw do
  root "articles#index"

  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new", as: :new_article
  get "/articles/:id", to: "articles#show", as: :article
  post "/articles", to: "articles#create"
  get "/articles/:id/edit", to: "articles#edit", as: :edit_article
  patch "/articles/:id", to: "articles#update"
  delete "/articles/:id", to: "articles#destroy"
end
```

This route will now match DELETE `/articles/:id` requests and send them to the *destroy* action in `ArticlesController`. Let's add this action now in the `ArticlesController`:
```ruby
def destroy
  article = Article.find(params[:id])
  article.destroy

  redirect_to articles_path
end
```

The complete `ArticlesController` in the `app/controllers/articles_controller.rb` file should now look like this:
```ruby
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy

    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
```

You can call `destroy` on model instances when you want to delete them from the database. Note that we don't need to add a view for this action since we're redirecting back to '/' -- the root of our application.

If we click "Delete" again on our list of articles, we'll each article disappear in turn.
We might want to be a little mindful here and ask users if they're really sure that they want to delete an article. Having a link so close to "Edit" like this is a recipe for disaster!

To prompt the user, we're going to change the "Delete" link in `app/views/articles/index.html.erb` to this:
```html
<%= link_to "Delete", article_path(article), method: :delete,
  data: {
    confirm: "Are you sure you want to delete this article?"
    }
%>
```

This data option uses a feature of Rails called Unobtrusive JavaScript. By default, Rails applications come with a little bit of JavaScript for features like this.

When we refresh this page and click "Delete" once again, we'll see a new dialog box appear

![Delete Article Confirmation](./images/delete_article_confirmation.png)

---

If you press "Cancel" on this box, nothing will happen. The article will not be deleted. But if you press "OK", then the article will be deleted. Rails provides this option on links just for links like this "Delete" link. We want people to be really sure that they mean to delete articles before they actually do it!

That is the last of our actions in the `ArticlesController`. We now have ways to **create**, **read**, **update** and **delete** articles. This pattern is so common in Rails applications that it even has its own acronym: **CRUD**: Create, Read, Update and Delete. What we have built here is a CRUD interface for articles.
