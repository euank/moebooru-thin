source "https://rubygems.org"

gem "rails", "~> 5.0.1"

gem "coffee-rails", "~> 4.0.0"
gem "coffee-rails-source-maps", :group => :development
gem "jquery-rails"
gem "jquery-ui-rails"
gem "uglifier"

gem "sass-rails"

gem "pg", :platforms => [:ruby, :mswin, :mingw]
gem "activerecord-jdbcpostgresql-adapter", "~> 1.3.0.rc1", :platforms => :jruby

### FIXME: remove this
gem "actionpack-page_caching"
gem "protected_attributes"
### FIXME: remove this

gem "diff-lcs"
gem "dalli"
gem "connection_pool"
gem "acts_as_versioned_rails3"
gem "geoip"
gem "exception_notification"
gem "will_paginate"
gem "will-paginate-i18n"
gem "sitemap_generator"
gem "daemons", :require => false
gem "newrelic_rpm"
gem "nokogiri"
gem "rails-i18n"
gem "addressable", :require => "addressable/uri"
gem "mini_magick"
gem "image_size"
gem "i18n-js", ">= 3.0.0.rc7"

gem "streamio-ffmpeg"
# The git 1.2.x contains webm; this is what we want
gem "file_signature", :git => 'http://github.com/distler/file_signature.git'

group :standalone do
  platform :mri do
    gem "unicorn", :require => false
    gem "unicorn-worker-killer", :require => false
  end
  gem "puma", :platforms => [:jruby, :rbx, :mswin], :require => false
end

group :test do
  gem "rails-controller-testing"
end

gem "pry", :group => [:development, :test]

gem "jbuilder", "~> 2.5" # Rails 5.0 default

gem "oj", :platforms => :mri
gem "multi_json"
gem "jbuilder"

# Must be last.
gem "rack-mini-profiler", :group => :development
