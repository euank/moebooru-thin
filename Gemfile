source "https://rubygems.org"

gem "rails", "~> 5.0.1"

gem "jquery-rails"
gem "jquery-ui-rails"
gem "uglifier"

gem "sass-rails"

gem "pg", :platforms => [:ruby, :mswin, :mingw]
gem "activerecord-jdbcpostgresql-adapter", "~> 1.3.0.rc1", :platforms => :jruby


gem "diff-lcs"
gem "json"
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

group :development do
  gem "puma"
end

group :test, :development do
  gem "rspec"
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "autotest"
  gem "autotest-standalone"
end

group :standalone do
  platform :mri do
    gem "unicorn", :require => false
    gem "unicorn-worker-killer", :require => false
    gem "gctools"
  end
  gem "puma", :platforms => [:jruby, :rbx, :mswin], :require => false
  gem "thin", :platforms => [:mswin, :mingw]
end

group :test do
  gem "rails-controller-testing"
end

gem "pry", :group => [:development, :test]

gem "oj", :platforms => :mri
gem "multi_json"
gem "jbuilder"

# Must be last.
gem "rack-mini-profiler", :group => :development
