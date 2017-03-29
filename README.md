# WeHuddle

WeHuddle is a Ruby-On-Rails, ActionCable touting, real-time chat application targeted at agile development teams.  This project presented many interesting challenges, including getting ActionCable, a new Rails v5 feature, to implement websockets and render chat windows in real time.  Fun stuff!

## Getting Started

Clone down!

...or visit the live [demo](http://wehuddle.herokuapp.com)


### Prerequisites

You need Ruby (which comes default with Mac)!

You also need to install imagemagick (v. < 7.0)
```
$ brew install imagemagick
```

### Installing

Once you've cloned down the repo and installed imagemagick, in terminal...

1. Have bundler install gems/dependencies
```
$ bundle install
```

2. Create a SQL database
```
$ rails db:create
```

3. Migrate database up
```
$ rails db:migrate
```

4. Run your rails server!
```
$ rails s
```
Navigate to localhost:3000 in your browswer to begin!

## RSpec on Rails

While in terminal, 'cd' into the root directory and run
```
$ rspec
```

## Deployment

Currently deployed to Heroku @ [wehuddle.herokuapp.com](https://wehuddle.herokuapp.com)

## Built With

* [RubyOnRails](https://github.com/rails/rails) - Our framework
* [Bundler](https://github.com/bundler/bundler) - Dependency management
* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) - Used to upload user avatars


## Versioning

We use [GitHub](https://github.com/) for versioning. For our commit history, see the [repo](https://github.com/ychoy/wehuddle). 

## Authors

* **Yan Yin Choy** - [GitHub](https://github.com/ychoy)
* **Thelma Boamah** - [GitHub](https://github.com/thelmaboamah)
* **Will Kaspar** - [GitHub](https://github.com/wakaspar)

See also the list of [contributors](https://github.com/ychoy/wehuddle/contributors) who participated in this project.

## License

Why does MIT license all our software, anyway?

## Acknowledgments

* Communication is hard
* Nathan and Michelle are great
* We all miss Sherri

* Logan's buying!
