[![Code Climate](https://codeclimate.com/github/moebooru/moebooru.png)](https://codeclimate.com/github/moebooru/moebooru)

Moebooru
========

This project is based on original Moebooru which is being used in [yande.re Image Board](http://yande.re). Changes compared to original Moebooru:

* Compatible with Ruby 1.9, JRuby 1.7, and Rubinius 2.0
* Uses Rails 4.0
* Updated gems
* Pool ZIP support for nginx (with `mod_zip`)

As this is still in development, bug reports are welcome.

* [Demo site](http://moe.myconan.net)
* [Source Repository](http://github.com/moebooru/moebooru)

Requirements
------------

As this is ongoing project, there will be more changes on requirement as this project goes. Currently this application requires:

* Ruby 2.0+
* PostgreSQL 9.4+
* Bundler gem
* ImageMagick
* And various other requirement for the gems (check `Gemfile` for the list)

On RHEL5 (and 6), it goes like this:

* gcc
* gcc-c++
* ImageMagick
* jhead
* libxslt-devel
* libyaml-devel
* git
* openssl-devel
* pcre-devel
* postgresql94-devel
* postgresql94-server
* readline-devel
* libmagic-devel

Base and EPEL repositories contain all the requirements.

On Ubuntu 10.04.4 LTS

* `apt-get install postgresql-contrib python-software-properties postgresql libpq-dev libxml2-dev libxslt-dev mercurial jhead build-essential libgd2-noxpm-dev libmagic-dev`

* [Brightbox repo](http://blog.brightbox.co.uk/posts/next-generation-ruby-packages-for-ubuntu) would work if you're too lazy to compile ruby

* add the ppa and then `apt-get install ruby1.9.3`

Installation
------------

### Database Setup

After initializing PostgreSQL database, create user for moebooru with `createdb` privilege:

    postgres# create user moebooru_user with password 'the_password' createdb;


### Rails Setup

* Run `bundle install`
* Create `config/database.yml` and `config/local_config.rb`
* Initialize database with `bundle exec rake db:reset` (there will be some errors reported which is expected)
* Run `bundle exec rake db:migrate`
* Start the server (`bundle exec unicorn` or `bundle exec puma` if using JRuby/Rubinius)

Configuration
-------------

See `config/local_config.rb.example`. Additionally, as I move to ENV-based configuration, here's the list of currently supported ENV variables:

- `MB_DATABASE_URL`: sets database connection configuration. Syntax: `postgres://<user>(:<pass>)@<host>(:<port>)/<dbname>`.
- `MB_MEMCACHE_SERVERS`: addresses of memcache servers. Separated by comma.
- `MB_PIWIK_HOST`: sets the host this application will attempt to contact a Piwik installation at. Defaults to false to not use Piwik if unset.
- `MB_PIWIK_ID`: sets the Site ID this application will send analytics data for.
- `MB_THREADS`: sets number of threads this application is running. Currently used to determine number of connection pool for `memcached`. Defaults to 1 if unset.

Plans
-----

* Bug fixes
* Documentation
* And more!
