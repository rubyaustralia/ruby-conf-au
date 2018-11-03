# RubyConf AU

## Setup

If this is this first time you are running the app:

```
$ gem install bundler
$ bundle install
```

Then start the app with:

```
$ foreman start
```

### Assets 2018-2019

To update styles, go into the appropriate year's assets folder and run the following commands:

```
$ cd assets/2019
$ yarn install
$ yarn build
```

During development, you probably want to be compiling assets on change:

```
$ cd assets/2019
$ yarn watch
```

### Assets 2016-2017

To update styles, go into the appropriate year's assets folder and run the following commands:

```
$ cd assets/2017
$ make
```

During development, you probably want to be compiling assets on change:

```
$ cd assets/2018
$ make watch
```

## Deploying

The site is automatically deployed when master is pushed to Github.
