# Ruby Conf AU Site

The full conference site is being delivered iteratively.

## Running locally

If this is this first time you are running the app:

    gem install bundler
    bundle install

Then start the app with:

    foreman start

If your're working on the app JS then watch and and compile the CoffeeScript as changes are made with:

    coffee -cw public/javascripts/*.coffee


## Deploy to Production

Site is hosted on Heroku

    git@heroku.com:ruby-conf-au.git

Deploy with command

    git push heroku master


## Deploy the WIP site

Set up the remote:

    git remote add heroku-wip git@heroku.com:rubyconf15wip.git

Push the 2015 branch as the master on Heroku:

    git push heroku-wip 2015:master
