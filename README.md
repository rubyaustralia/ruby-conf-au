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