# House Manager

Everything you need to set up house manager. Stuff for Will

AWS Setup: Do this shit when you want to deploy: http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_Ruby_rails.html

https://www.sitepoint.com/deploy-your-rails-app-to-aws/

Firstly install PostgreSQL, none of this stuff works without it.

Then install RVM, this will let you get ruby installed.

Install bundler after installing ruby (not jruby)

`gem install bundler`

Clone the app into your folder.

Install the gems using bundler

`bundle install`

If bundler freaks out at you, do this:

`sudo su - u (YOUR USER NAME HERE NO PARENS) 'bundle install'`

Run the migrations so that the db has data. You will probably have to create a role for your user account. Google how to do that. Give yourself a ton of perms so that you can create/delete dbs and what not.

```
rails db:create
rails db:migrate
```
Everything should be good to go. Open a console in another window and do:

`rails s`

This starts the server. To visit, go to http://localhost:3000
---
On the to do list:
* Late plates
* Chores
* Study Hours
* Service Hours
* File Hosting
* Maintenance Requests
