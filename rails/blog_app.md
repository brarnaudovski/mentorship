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
❯ bin/rails server
```

This will fire up Puma, a web server distributed with Rails by default. To see your application in action, open a browser window and navigate to `http://localhost:3000`. You should see the Rails default information page:

![Rails welcome logo][rails_welcome]

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

Launch the web server again if you stopped it to generate the controller *(rails server)8 and navigate to `http://localhost:3000` in your browser. You'll see the "Hello, Rails!" message you put into `app/views/articles/index.html.erb`, indicating that this new route is indeed going to `ArticleController`'s `index` action and is rendering the view correctly.


[rails_welcome]: ./images/rails_welcome.png "Rails Welcome"
