# Ruby Conf AU One Page Holding Site

A temporary site to get the conference on people's radars. The full conference site will be developed in late July.

## Running locally

If this is this first time you are running the app:

    gem install bundler
    bundle install

Then start the app with:

    foreman start

If your're working on the app JS then watch and and compile the CoffeeScript as changes are made with:

    coffee -cw public/javascripts/*.coffee


## Deploy

Site is hosted on Heroku.

    git push heroku master