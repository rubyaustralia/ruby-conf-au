# RubyConf AU

## Setup

If this is this first time you are running the app, you need Ruby, Node, and Yarn installed.

It is recommended that you use [asdf](https://asdf-vm.com/) to install the versions that are specified in `.tool-versions`.

Then you can run the following commands:

```
$ gem install bundler
$ bundle install
$ yarn install
$ yarn run webpack
```

Then start the app with:

```
$ foreman start
```

### Assets

Assets are managed via Webpack, with each year in a separate directory within /assets. To compile:

```
$ yarn run webpack
```

At this point in time there's no distinction between development and production asset generation, and there's no live-rebuilding of assets. Both of these would be nice though.

## Deploying

The site is automatically deployed when master is pushed to Github.

## Create New Year Event

Copy previous year folders e.g. :

```
app/year_2020
assets/2020
views/2020
```

Modify `app.rb` to include the new year information

Modify `webpack.config.js` to include the new year information