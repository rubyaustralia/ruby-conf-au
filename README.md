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


## Deploy to Production

Site is hosted on Heroku.

    git push heroku master

## Deploy to WIP Full Site to Staging

The staging site for the full site is hosted at

    http://rubyconf-staging.herokuapp.com/speakers

Add the remote to your git config

    [remote "staging"]
        url = git@heroku.com:rubyconf-staging.git
        fetch = +refs/heads/*:refs/remotes/staging/*

Deploy to staging with the command

    git push staging full-site:master