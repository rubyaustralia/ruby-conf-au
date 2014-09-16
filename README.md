# Ruby Conf AU Site

The full conference site is being delivered iteratively.

## Developing

If this is this first time you are running the app:

    gem install bundler
    bundle install

Then start the app with:

    foreman start

### 2015

The 2015 styles are compiled and checked in. To recompile them:

    cd 2015

    # Compile the assets
    make

    # Watch assets for change and automatically recompile
    make watch

## Deploying

Site is hosted on Heroku

    git@heroku.com:ruby-conf-au.git

Deploy with command

    git push heroku master
