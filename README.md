# Ruby Conf AU Site

The full conference site is being delivered iteratively.

## Developing

If this is this first time you are running the app:

    gem install bundler
    bundle install

Then start the app with:

    foreman start

### 2016

2016 follows the same pattern as 2015. To update styles: 

    cd 2016

    # Compile the assets
    make

    # Watch assets for change and automatically recompile
    make watch

## Deploying

Site is hosted on Heroku

    git@heroku.com:ruby-conf-au.git

Deploy with command

    git push heroku master
