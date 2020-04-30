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
