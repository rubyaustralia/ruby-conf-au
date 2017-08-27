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

### Assets 2016-2018

To update styles:

```
$ cd assets/2018
$ make
```

During development, you probably want to be compiling assets on change:

```
$ cd assets/2018
$ make watch
```

## Deploying

The site is automatically deployed when master is pushed to Github.
